begin
  require "dotenv"
  Dotenv.load
rescue LoadError
  # dotenv not installed
end

require 'bundler/setup'
require 'pakyow'

Pakyow::App.define do
  configure :global do
    Bundler.require :default, Pakyow::Config.env

    # put global config here and they'll be available across environments
    app.name = 'Pakyow'

    # TODO move this to a method or something?
    database_url = ENV.fetch("DATABASE_URL")
    rom_config = ROM::Configuration.new(:sql, database_url)
      .use(:macros)
    rom_config.commands(:links) do
      define(:create) do
        result :one
      end

      define(:delete)
    end

    app.rom = ROM.container(rom_config)
  end

  configure :development do
    # put development config here
  end

  configure :prototype do
    # an environment for running the front-end prototype with no backend
    app.ignore_routes = true
  end

  configure :staging do
    # put your staging config here
  end

  configure :production do
    # put your production config here
  end

  middleware do |builder|
    # TODO: you will most definitely want to change this secret
    builder.use Rack::Session::Cookie, key: "#{Pakyow::Config.app.name}.session", secret: 'sekret'
  end
end
