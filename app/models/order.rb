class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  tax_rate = 0.09

  def calculate_totals
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.subtotal
    end

    tax = subtotal * tax_rate
    total = subtotal + tax
    update(subtotal: subtotal, tax: tax, total: total)
  end

end
