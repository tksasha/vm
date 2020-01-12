# frozen_string_literal: true

class Product < ApplicationModel
  self.database = 'db/products.yml'

  class << self
    def find(id)
      all.select { |product| product['id'] == id }.first || raise(ProductNotFoundError)
    end

    def pop(id)
      product = find(id)

      return unless product['quantity'].positive?

      product['quantity'] -= 1
    end
  end
end
