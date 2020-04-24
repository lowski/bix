# frozen_string_literal: true

Bix::Application.boot(:persistence) do |app|
  start do
    config = app["db.config"]
    config.auto_registration(app.root + "lib/bix")
    register("container", ROM.container(config))
  end
end
