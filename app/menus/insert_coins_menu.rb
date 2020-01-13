# frozen_string_literal: true

# TODO: try to spec it
class InsertCoinsMenu < ApplicationMenu
  def render(price, coins)
    prompt.select "Please insert #{ price - coins } coins" do |menu|
      Coin.all.each_key do |coin|
        menu.choice coin, coin
      end
    end
  end
end
