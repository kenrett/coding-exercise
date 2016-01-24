# implement this
require 'active_support/all'

module BlueBottle
  module Models
    class Subscription
      attr_accessor :id,
                    :coffee_id,
                    :customer_id

      def initialize(coffee_id, customer_id)
        @coffee_id = coffee_id
        @customer_id = customer_id
      end
    end
  end
end
