# frozen_string_literal: true

Bix::Application.boot(:core) do
  init do
    require "dry/monads"
    require "dry/monads/do"
    require "dry-validation"
  end

  start do
    Dry::Validation.load_extensions(:monads)
  end
end
