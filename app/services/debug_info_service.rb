# frozen_string_literal: true

# TODO: spec me
class DebugInfoService
  def initialize(price, total_inserted_coins, inserted_coins)
    @price = price

    @total_inserted_coins = total_inserted_coins

    @inserted_coins = inserted_coins
  end

  def render
    render_header
    render_price
    render_coins
    render_products_in_the_storage
    render_coins_in_the_storage
    render_inserted_coins
    render_footer
  end

  private

  def pastel
    @pastel ||= Pastel.new
  end

  def render_header
    print "\n"
    puts pastel.bold.black 'DEBUG:'
    puts pastel.bold '------'
  end

  def render_price
    puts "Price: #{ pastel.bold @price }"
  end

  def render_coins
    puts "Coins: #{ pastel.bold @total_inserted_coins }"
  end

  def render_products_in_the_storage
    puts pastel.bold 'Products in the storage:'
    puts Product.all
  end

  def render_coins_in_the_storage
    puts pastel.bold 'Coins in the storage:'
    puts Coin.all
  end

  def render_inserted_coins
    puts pastel.bold 'Inserted Coins:'
    puts @inserted_coins
  end

  def render_footer
    puts pastel.bold '------'
  end

  class << self
    def render(*args)
      new(*args).render
    end
  end
end
