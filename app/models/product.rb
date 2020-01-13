# frozen_string_literal: true

class Product < ApplicationModel
  self.database = 'db/products.yml'

  class << self
    def find(id)
      all.find { |product| product['id'] == id } || raise(ProductNotFoundError)
    end

    def pop(id)
      product = find(id)

      return unless product['quantity'].positive?

      product['quantity'] -= 1
    end

    def available
      all.select { |product| product['quantity'].positive? }
    end
  end
end
