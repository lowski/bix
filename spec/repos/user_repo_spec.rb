# frozen_string_literal: true

require "spec_helper"

RSpec.describe Bix::Repos::UserRepo do
  describe "#create" do
    it "creates a new user" do
      user = subject.create(first_name: "Homer", last_name: "Simpson", age: 30)

      expect(user).to be_a(Bix::User)
      expect(user).to have_attributes(
        id: an_instance_of(Integer),
        first_name: "Homer",
        last_name: "Simpson",
        age: 30,
        created_at: an_instance_of(Time),
        updated_at: an_instance_of(Time)
      )
    end
  end

  describe "#all" do
    before do
      subject.create(first_name: "Homer", last_name: "Simpson", age: 30)
    end

    it "returns all users" do
      expect(subject.all).to contain_exactly(a_kind_of(Bix::User))
    end
  end
end
