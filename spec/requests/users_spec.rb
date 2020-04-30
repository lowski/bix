# frozen_string_literal: true

require "web_helper"

RSpec.describe "users", type: :request do
  describe "POST /users" do
    let(:params) do
      {
        first_name: "Bart",
        last_name: "Simpson",
        age: 30
      }
    end

    it "succeeds" do
      post_json "/users", params
      response = json_body

      expect(response["id"]).not_to be_nil
      expect(response["first_name"]).to eq("Bart")
      expect(response["last_name"]).to eq("Simpson")
      expect(response["age"]).to eq(30)
    end

    context "with invalid params" do
      let(:params) do
        { first_name: "Bart", age: 30 }
      end

      it "fails" do
        post_json "/users", params
        expect(last_response.status).to eq(422)
        response = json_body
        expect(response["errors"]["last_name"]).to include("is missing")
      end
    end
  end
end
