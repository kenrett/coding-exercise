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

    def pause_subscription(customer, coffee, subscription)
      subscription.first.status = "paused"
      coffee_to_pause = coffee.name
      customer.active_subscriptions.each do |sub|
        if sub == coffee_to_pause
          customer.active_subscriptions.delete(sub)
          customer.paused_subscriptions << coffee_to_pause
        end
      end
    end

    def cancel_subscription(customer, coffee)
      self.subscriptions.each do |sub|
        if sub.status == "paused"
          raise "'Sub status is paused. You cannot cancel a paused account."
        end
        if sub.customer_id == customer.id && sub.coffee_id == coffee.id && sub.status == "active"
          customer.active_subscriptions.delete(coffee.name)
          sub.status = "cancelled"
        end
      end
    end
  end
end
