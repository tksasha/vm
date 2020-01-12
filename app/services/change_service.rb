# frozen_string_literal: true

class ChangeService
  def initialize(sum)
    @sum = sum
  end

  # rubocop:disable Metrics/MethodLength
  def calculate
    result = Hash.new(0)

    while @sum.positive?
      raise InsufficientCoinsError unless Coin.sufficient? @sum

      Coin.all.each do |coin, quantity|
        next if coin > @sum

        next unless quantity.positive?

        result[coin] += 1

        @sum -= coin

        Coin.pop coin

        break
      end
    end

    result
  end
  # rubocop:enable Metrics/MethodLength

  class << self
    def calculate(*args)
      new(*args).calculate
    end
  end
end
