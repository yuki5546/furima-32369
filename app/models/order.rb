class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :prefecture, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'Input only number' }
  end

  def save
    transaction_item = TransactionItem.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address,
                           building: building, phone_number: phone_number, transaction_item_id: transaction_item.id)
  end
end
