class UserOrder
  include ActiveModel::Model
  attr_accessor :zip, :state, :city, :adress_line, :address_line_second, :phone_number

  with_options presence: true do
    validates :zip, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :state_id, numericality: { other_than: 0 }
    validates :city
    validates :address_line
    validates :phone_number, format: {with: /\A\d{11}\z/}
  end

  def save
    Order.create( item_id: item_id, address_id: address_id)

    Address.create( zip: zip, state_id: state_id, city: city, address_line: adress_line, address_line_second: address_line_second, phone_number: phone_number)
  end
end