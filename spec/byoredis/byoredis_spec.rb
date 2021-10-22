# frozen_string_literal: true
require "redis"
require "byoredis"

SERVER_PORT = ENV["SERVER_PORT"]

RSpec.describe Byoredis do
  it "has a version number" do
    expect(Byoredis::VERSION).not_to be nil
  end

  it "responds to ping" do
    r = Redis.new port:SERVER_PORT
    expect(r.ping).eql? ("PONG")
  end

  it "responds to multiple commands" do
    r = Redis.new port:SERVER_PORT
    r.without_reconnect do
      expect(r.ping).eql? ("PONG")
      expect(r.ping).eql? ("PONG")
    end
  end

  it "connects to multiple clients" do
    r1 = Redis.new port:SERVER_PORT
    r2 = Redis.new port:SERVER_PORT

    expect(r1.ping).eql? ("PONG")
    expect(r2.ping).eql? ("PONG")
  end
end
