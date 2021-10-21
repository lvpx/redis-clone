# frozen_string_literal: true

RSpec.describe Redis::Clone do
  it "has a version number" do
    expect(Redis::Clone::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end

  it "responds to ping" do
    SERVER_PORT = ENV["SERVER_PORT"]
    r = Redis::Clone.Server.new(port: SERVER_PORT)
    expect(r.ping).eq("PONG")
  end
end
