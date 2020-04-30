# frozen_string_literal: true

require "spec_helper"
require "rack/test"

module RequestHelpers
  def app
    Bix::Web.app
  end

  def post_json(path, data)
    post path, data.to_json, "CONTENT_TYPE" => "application/json"
  end

  def json_body
    JSON.parse(last_response.body)
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include RequestHelpers, type: :request
end
