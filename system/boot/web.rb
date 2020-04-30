# frozen_string_literal: true

Bix::Application.boot(:web) do |_app|
  init do
    require "hanami-controller"
    require "hanami-router"
  end
end
