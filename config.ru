# frozen_string_literal: true

require_relative "config/application"

Bix::Application.finalize!

run Bix::Web.app
