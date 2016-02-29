require "spec_helper"
require "capybara/rspec"
require "pakyow-test"

require "dotenv"
Dotenv.load(".env.test")

Pakyow::TestHelp.setup

Capybara.app = Pakyow.app

RSpec.configure do |config|
  config.include Pakyow::TestHelp::Helpers
end

# Monkeypatch to fix issue in test helper
# see https://gitter.im/pakyow/chat?at=56cded078bbe6265248f8188
module Pakyow
  class Request
    def params
      @params ||= Hash.strhash(super.merge!(env['pakyow.data'] || {}).merge!(JSON.parse(body.read.to_s)))
    rescue JSON::JSONError
      @params = Hash.strhash(super)
    end
  end
end
