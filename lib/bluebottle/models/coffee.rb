require 'active_support/all'
require 'pry'
module BlueBottle
  module Models
    class Coffee
      attr_accessor :id,
                    :name,
                    :type

      VALID_TYPES = ['blend', 'single_origin']

      def initialize(id, name, type)
        @id = id
        @name = name
        @type = type
        validate_type
      end

      def active_subscribers(store)
        total = []
        store[:subscriptions].each do |s|
          if s.coffee_id == self.id && s.status == "active"
            total << s.coffee_id
          end
        end
        total.size
      end

      def total_subscribers(store)
        total = []
        store[:subscriptions].each do |s|
          if s.coffee_id == self.id
            total << s.coffee_id
          end
        end
        total.size
      end

      private

      def validate_type
        raise "'#{type}' is not a valid type of coffee. Valid types are #{VALID_TYPES.join(', ')}." unless VALID_TYPES.include?(type)
      end

    end
  end
end
