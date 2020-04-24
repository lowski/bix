# frozen_string_literal: true

Bix::Application.boot(:db) do
  init do
    require "rom"
    require "rom-sql"
  end

  start do
    register("db.config", ROM::Configuration.new(:sql, ENV["DATABASE_URL"]))
  end
end
