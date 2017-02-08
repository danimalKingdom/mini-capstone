class ProductsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    if session[:count] == nil
      session[:count] = 0
    end
    session[:count] += 1 
    @visit_count = session[:count]
    @products = Product.all
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end
  end

  def new
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier]['supplier_id']
      )
    @product.images.create(url: params[:image], product_id: @product.id)

    flash[:success] = "Product Created"
    redirect_to "/products/#{@product.id}"
  end

  def show
    @product = Product.find_by(id: params[:id])
    #returns single instance supplier hash
    @supplier = @product.supplier
    #returns array with image hashes
    @images = @product.images
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      price: params[:price],
      supplier_id: params[:supplier_id]
      )

    flash[:success] = "Product Updated"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    flash[:warning] = "Product Destroyed"
    redirect_to "/"
  end
end

