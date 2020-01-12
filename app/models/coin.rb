# frozen_string_literal: true

require 'yaml'

class Coin
  DATABASE = 'db/coins.yml'

  class << self
    def all
      @all ||= YAML.safe_load File.read DATABASE
    end

    def available
      all.select { |_, value| value.positive? }
    end

    def push(coin)
      return unless all.key? coin

      all[coin] = quantity(coin) + 1
    end

    def pop(coin)
      return unless all.key? coin

      return unless all[coin].positive?

      all[coin] = quantity(coin) - 1
    end

    def sum(value)
      all
        .select { |coin, _| coin <= value }
        .sum { |coin, quantity| coin * quantity }
    end

    def sufficient?(value)
      sum(value) >= value
    end

    private

    def quantity(coin)
      all.fetch(coin) { 0 }
    end
  end
end
