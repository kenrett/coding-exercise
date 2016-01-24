require 'bluebottle'
require 'bluebottle/coding_question'

describe BlueBottle::CodingQuestion do
  let(:sally) { BlueBottle::Models::Customer.new(1, 'Sally', 'Fields', 'sally@movies.com') }
  let(:jack) { BlueBottle::Models::Customer.new(2, 'Jack', 'Nickleson', 'jack@movies.com') }
  let(:liv) { BlueBottle::Models::Customer.new(3, 'Liv', 'Tyler', 'liv@movies.com') }
  let(:elijah) { BlueBottle::Models::Customer.new(4, 'Elijah', 'Wood', 'elijah@movies.com') }

  let(:bella_donovan) { BlueBottle::Models::Coffee.new(1, 'Bella Donovan', 'blend') }
  let(:giant_steps) { BlueBottle::Models::Coffee.new(2, 'Giant Steps', 'blend') }
  let(:hayes_valley_espresso) { BlueBottle::Models::Coffee.new(3, 'Hayes Valley Espresso', 'blend') }

  let(:store) { BlueBottle::DataStore.new }
  let(:subscription_service) { BlueBottle::Services::SubscriptionService.new(store) }

  before do
    store.add_customer(sally)
    store.add_customer(jack)
    store.add_customer(liv)
    store.add_customer(elijah)

    store.add_coffee(bella_donovan)
    store.add_coffee(giant_steps)
    store.add_coffee(hayes_valley_espresso)
  end

  context 'Sally subscribes to Bella Donovan' do
    before do
      store.add_subscription(sally, bella_donovan)
    end

    it 'Sally should have one active subscription' do
      expect(sally.active_subscriptions.size).to eq(1)
    end

    it 'Bella Donovan should have one customer subscribed to it' do
      expect(bella_donovan.subscribers.size).to eq(1)
    end
  end

  context 'Liv and Elijah subscribe to Hayes Valley Espresso' do
    before do
      store.add_subscription(liv, hayes_valley_espresso)
      store.add_subscription(elijah, hayes_valley_espresso)
    end

    it 'Liv should have one active subscription' do
      expect(liv.active_subscriptions.size).to eq(1)
    end

    it 'Elijah should have one active subscription' do
      expect(elijah.active_subscriptions.size).to eq(1)
    end

    it 'Hayes Valley Espresso should have two customers subscribed to it' do
      expect(hayes_valley_espresso.subscribers.size).to eq(2)
    end
  end

  context 'Pausing:' do
    context 'when Liv pauses her subscription to Bella Donovan,' do
      before do
        @subscription = store.add_subscription(liv, bella_donovan)
        store.pause_subscription(liv, bella_donovan, @subscription)
      end

      it 'Liv should have zero active subscriptions' do
        expect(liv.active_subscriptions.size).to eq(0)
      end

      it 'Liv should have a paused subscription' do
        expect(liv.paused_subscriptions.size).to eq(1)
      end

      it 'Bella Donovan should have one customers subscribed to it' do
        expect(bella_donovan.subscribers.size).to eq(1)
      end
    end
  end

  context 'Cancelling:' do
    context 'when Jack cancels his subscription to Bella Donovan,' do
      before do
        # Establish subscription here
      end

      xit 'Jack should have zero active subscriptions' do
      end

      xit 'Bella Donovan should have zero active customers subscribed to it' do
      end

      context 'when Jack resubscribes to Bella Donovan' do
        before do
          # Establish subscription here
        end

        xit 'Bella Donovan has two subscriptions, one active, one cancelled' do
        end

      end
    end
  end

  context 'Cancelling while Paused:' do
    context 'when Jack tries to cancel his paused subscription to Bella Donovan,' do
      before do
        # Establish paused subscription here
      end

      xit 'Jack raises an exception preventing him from cancelling a paused subscription' do
      end
    end
  end



end
