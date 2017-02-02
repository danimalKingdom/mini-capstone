class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  def calculate_totals(price, quantity)
    self.subtotal = price * quantity
    self.tax = subtotal * 0.09
    self.total = subtotal + tax
  end

end
