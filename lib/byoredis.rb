# frozen_string_literal: true

require "socket"
require_relative "byoredis/version"

module Byoredis
  class Error < StandardError; end
    
  class Server
    attr_accessor :server

    def initialize(host: "127.0.0.1", port: "5000") 
      @server = TCPServer.new(host ,port)
    end

    def listen
      loop do
        client = @server.accept
        handle_client(client)
      end
    end

    def handle_client(client)
      Thread.new do
        loop do
          client.gets
          client.write("+PONG\r\n")
        end
      end
    end

    def shutdown
      @server.shutdown
    end
  end
end