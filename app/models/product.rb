class Product < ActiveRecord::Base
  #rails is making a method (called supplier) on our product class that returns a single instance hash of the product's supplier
  belongs_to :supplier
  has_many :images
end
