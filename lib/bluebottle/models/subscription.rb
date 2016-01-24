# implement this
require 'active_support/all'

module BlueBottle
  module Models
    class Subscription
      attr_accessor :id,
                    :coffee_id,
                    :customer_id,
                    :status

      def initialize(coffee_id, customer_id, status = "active")
        @coffee_id = coffee_id
        @customer_id = customer_id
        @status = status
      end
    end
  end
end
