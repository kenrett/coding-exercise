module BlueBottle

  class DataStore
    def initialize
      @store = {
        customers: [],
        coffees: [],
        subscriptions: []
      }
    end

    def customers
       @store[:customers]
    end

    def subscriptions
      @store[:subscriptions]
    end

    def add_coffee(coffee)
      @store[:coffees] << coffee
    end

    def add_customer(customer)
      @store[:customers] << customer
    end

    def add_subscription(customer, coffee)
      customer.active_subscriptions << coffee.name
      coffee.subscribers << customer
      self.subscriptions << BlueBottle::Models::Subscription.new(coffee.id, customer.id)
    end
  end
end
