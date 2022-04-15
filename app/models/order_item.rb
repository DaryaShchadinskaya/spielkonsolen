class OrderItem < ApplicationRecord
  belongs_to :device
  belongs_to :cart
  belongs_to :order
  before_save :set_unit_price
  before_save :set_total_price
  # validate :no_past_booking
  # validates_presence_of :start_date, :end_date

  # def no_past_booking
  #   if Date.today > start_date.to_date || Time.now > start_date.to_time
  #     errors.add(:Starts, 'cannot be in the past')
  #   elsif Date.today > end_date.to_date || Time.now > end_date.to_time
  #     errors.add(:Ends, 'cannot be in the past')
  #   end
  # end

  def unit_price
    if persisted?
      self[:unit_price]
    else
      device.price
    end
  end


  # that's for the future

  # def add_quantity
  #   @order_item = OrderItem.find(params[:id])
  #   @order_item.quantity += 1
  #   @order_item.save
  #   redirect_to cart_path(@current_cart)
  # end
  
  # def reduce_quantity
  #   @order_item = OrderItem.find(params[:id])
  #   if @order_item.quantity > 1
  #     @order_item.quantity -= 1
  #   end
  #   @order_item.save
  #   redirect_to cart_path(@current_cart)
  # end

  def total_price
    unit_price * (end_date.to_date - start_date.to_date).to_i
    case date
    when 2
      unit_price * 1.5
    when 3
      unit_price * 2
    when 7
      unit_price * 5
    when ((end_date.to_time - start_date.to_time) / 1.month.second).to_i
      unit_price * 20
    else
      unit_price
    end
  end


  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total_price
    self[:total_price] = set_unit_price * (end_date.to_date - start_date.to_date).to_i
  end
end
