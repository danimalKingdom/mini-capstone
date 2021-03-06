class Product < ActiveRecord::Base
  #rails is making a method (called supplier) on our product class that returns a single instance hash of the product's supplier
  belongs_to :supplier
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { maximum: 500 }
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  
end
