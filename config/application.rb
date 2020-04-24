# frozen_string_literal: true

require_relative "boot"
require "dry/auto_inject"
require "dry/system/container"

module Bix
  class Application < Dry::System::Container
    configure do |config|
      config.auto_register = "lib"
      config.default_namespace = "bix"
      config.root = File.expand_path("..", __dir__)
    end

    load_paths!("lib")
  end

  Import = Dry::AutoInject(Application)
end
