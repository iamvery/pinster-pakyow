require "spec_helper"
require "pakyow-test"

require "dotenv"
Dotenv.load(".env.test")

Pakyow::TestHelp.setup

RSpec.configure do |config|
  config.include Pakyow::TestHelp::Helpers
end
