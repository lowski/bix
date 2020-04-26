require 'spec_helper'

RSpec.describe Bix::Repos::UserRepo do
  describe '#create' do
    it 'creates a new user' do
      user = subject.create(first_name: "Homer", last_name: "Simpson", age: 30)

      # irb(#<RSpec::ExampleGroups::BixReposUserRepo::Create:0x00007fbe86b01de0>):001:0> user.class.ancestors
      # => [Bix::User, Bix::User, ROM::Struct, Dry::Struct, Dry::Equalizer::Methods, #<Dry::Equalizer:0x00007fbe860dbde8>,
      #     Dry::Core::Constants, Object, JSON::Ext::Generator::GeneratorMethods::Object, Kernel, BasicObject]

      expect(user).to be_instance_of(Bix::User)
    end
  end
end
