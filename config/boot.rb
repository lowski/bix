# frozen_string_literal: true

ENV["APP_ENV"] = "DEVELOPMENT"

require "bundler"
Bundler.require(:default, ENV["APP_ENV"])

require "dotenv"
Dotenv.load(".env.#{ENV['APP_ENV']}.local", ".env.#{ENV['APP_ENV']}", ".env")
