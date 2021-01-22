class UserOrder
  include ActiveModel::Model
  attr_accessor :zip, :state, :city, :adress_line, :address_line_second, :phone_number
end