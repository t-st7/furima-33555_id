class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates [:product, :description, :category_id, :delivery_charge_id, :state_id, :condition_id, :days_id, :image]
  end

  with_options presence: true, format: {with: /\A[0-9]+\z/
    } do
    validates :price
  end
end
