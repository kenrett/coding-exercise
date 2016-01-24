require 'active_support/all'

module BlueBottle
  module Models
    class Coffee
      attr_accessor :id,
                    :name,
                    :type,
                    :subscribers

      VALID_TYPES = ['blend','single_origin']

      def initialize(id, name, type, subscribers = [])
        @id = id
        @name = name
        @type = type
        @subscribers = subscribers
        validate_type
      end

      private

      def validate_type
        raise "'#{type}' is not a valid type of coffee. Valid types are #{VALID_TYPES.join(', ')}." unless VALID_TYPES.include?(type)
      end

    end
  end
end
