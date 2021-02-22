class ShippingAddress < ApplicationRecord
  belongs_to :transaction_item
end
