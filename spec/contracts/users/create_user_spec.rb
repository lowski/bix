# frozen_string_literal: true

require "spec_helper"

RSpec.describe Bix::Contracts::Users::CreateUser do
  subject { described_class.new.call(input) }

  let(:input) do
    {
      first_name: "Homer",
      last_name: "Simpson",
      age: "30",
    }
  end

  it { is_expected.to be_success }

  context "without age" do
    let(:input) do
      {
        first_name: "Homer",
        last_name: "Simpson",
      }
    end

    it { is_expected.to be_success }
  end

  context "without first_name" do
    let(:input) do
      {
        last_name: "Simpson"
      }
    end

    it "is invalid" do
      expect(subject).to be_failure
      expect(subject.errors[:first_name]).to include("is missing")
    end
  end

  context "without last_name" do
    let(:input) do
      {
        first_name: "Homer"
      }
    end

    it "is invalid" do
      expect(subject).to be_failure
      expect(subject.errors[:last_name]).to include("is missing")
    end
  end
end
