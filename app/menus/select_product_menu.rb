# frozen_string_literal: true

# TODO: try to spec it
class SelectProductMenu < ApplicationMenu
  def render
    prompt.select 'Select your Product' do |menu|
      Product.available.each do |product|
        menu.choice product['name'], product['id']
      end
    end
  end
end
