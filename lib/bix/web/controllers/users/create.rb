# frozen_string_literal: true

module Bix
  module Web
    module Controllers
      module Users
        class Create
          include Hanami::Action
          include Import["transactions.users.create_user"]
          include Dry::Monads[:result]

          def call(params)
            result = create_user.call(params.to_h)

            case result
            when Success
              self.body = result.value!.to_h.to_json
            when Failure
              self.body = { errors: result.failure.errors.to_h }.to_json
              self.status = 422
            end
          end
        end
      end
    end
  end
end
