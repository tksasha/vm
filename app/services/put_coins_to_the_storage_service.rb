# frozen_string_literal: true

class PutCoinsToTheStorageService
  def initialize(coins)
    @coins = coins
  end

  def execute
    @coins.each do |coin, quantity|
      quantity.times { Coin.push coin }
    end
  end

  class << self
    def execute(*args)
      new(*args).execute
    end
  end
end
