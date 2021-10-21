# frozen_string_literal: true

require_relative "clone/version"

module Redis
  module Clone
    class Error < StandardError; end
    
    class Server
      def initialize(port)
        @server = TCPServer.new(port)
      end

      def listen
        loop do
          client = @server.accept
        end
      end
    end
  end
end
