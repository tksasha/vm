# frozen_string_literal: true

# TODO: spec me
class PurchaseService
  class << self
    def success(product_id, inserted_coins)
      Product.pop product_id

      PutCoinsToTheStorageService.execute inserted_coins
    end

    def failure(product_id)
      Product.push product_id

      puts pastel.bold.red "Sorry, but we don't have sufficient total_inserted_coins to change."
    end
  end
end
