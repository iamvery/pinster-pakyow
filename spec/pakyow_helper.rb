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
