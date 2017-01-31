class Supplier < ActiveRecord::Base
  # rails is creating a method (called products) that we can call on our supplier, returning a array of products
  has_many :products
end
