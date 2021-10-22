# frozen_string_literal: true

require "socket"
require "redis"
require_relative "byoredis/version"

module Byoredis
  class Error < StandardError; end
    
  class Server
    attr_accessor :server

    def initialize(host, port)
      @server = TCPServer.new(host ,port)
    end

    def listen
      loop do
        client = @server.accept
        client.write("+PONG\r\n")
      end
    end
  end
end

server = Byoredis::Server.new "127.0.0.1","6799"
server.listen