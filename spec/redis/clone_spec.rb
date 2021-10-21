# frozen_string_literal: true

RSpec.describe Redis::Clone do
  it "has a version number" do
    expect(Redis::Clone::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  it "responds to ping" do
    SERVER_PORT = ENV["SERVER_PORT"]
    SERVER_HOST = ENV["SERVER_HOST"]
    puts "SERVER_PORT - #{SERVER_PORT}"
    r = Redis::Clone::Server.new(SERVER_HOST, SERVER_PORT)
    expect(r.ping).eq("PONG")
  end
end
