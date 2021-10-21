# frozen_string_literal: true
require "socket"
require_relative "clone/version"

module Redis
  module Clone
    class Error < StandardError; end
    
    class Server
      attr_accessor :server

      def initialize(host, port)
        @server = TCPServer.new(host ,port)
      end

      def listen
        loop do
          client = @server.accept
        end
      end
    end
  end
end