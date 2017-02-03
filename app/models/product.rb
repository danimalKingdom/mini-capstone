class Product < ActiveRecord::Base
  #rails is making a method (called supplier) on our product class that returns a single instance hash of the product's supplier
  belongs_to :supplier
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products


  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end
end
