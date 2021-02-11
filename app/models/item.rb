class Item < ApplicationRecord
  belongs_to :user
  has_one :transaction_item
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, numericality: { only_integer: true, message: 'Half-width number' },
                      inclusion: { in: 300..9_999_999, message: 'Out of setting range' }
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end
