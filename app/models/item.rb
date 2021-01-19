class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :delivery_charge, :condition, :day_to_ship, :state

  with_options presence: true do
    validates :product
    validates :description
    validates :image
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
                    numericality: {
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9_999_999
                    }

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id, :delivery_charge_id, :condition_id, :day_to_ship_id
  end

  validates :state_id, presence: true, numericality: { other_than: 0 }
end
