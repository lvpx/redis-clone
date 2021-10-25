# frozen_string_literal: true

require "socket"
require_relative "byoredis/version"

module Byoredis
  class Error < StandardError; end
    
  class Server
    attr_accessor :server

    def initialize(host: "127.0.0.1", port: "5000") 
      @server = TCPServer.new(host ,port)
      @clients = []
    end

    def listen
      loop do
        fds_to_watch = [@server, *@clients]
        ready_to_read, _, _ = IO.select(fds_to_watch)
        ready_to_read.each do |ready|
          if ready == @server
            @clients << @server.accept    
          else
            handle_client(client)
          end
          
        end
      end
    end

    def handle_client(client)
      client.read_partial(1024)
      client.write("+PONG\r\n")
    end

    def shutdown
      @server.shutdown
    end
  end
end