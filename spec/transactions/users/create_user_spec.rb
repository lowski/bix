# frozen_string_literal: true

require "spec_helper"

RSpec.describe Bix::Transactions::Users::CreateUser do
  subject { described_class.new(user_repo: user_repo) }

  let(:user_repo) { instance_double("Bix::Repos::UserRepo") }

  describe "#call" do
    context "with valid input" do
      it "creates a user" do
        input = { first_name: "Homer", last_name: "Simpson" }
        user = Bix::User.new(id: 1, first_name: "Homer", last_name: "Simpson")

        expect(user_repo).to receive(:create).and_return(user)
        result = subject.call(input)

        expect(result).to be_success
        expect(result.success).to eq(user)
      end
    end

    context "with invalid input" do
      it "does not create a user" do
        input = { last_name: "Simpson" }

        expect(user_repo).not_to receive(:create)
        result = subject.call(input)

        expect(result).to be_failure
        expect(result.failure.errors[:first_name]).to include("is missing")
      end
    end
  end
end
