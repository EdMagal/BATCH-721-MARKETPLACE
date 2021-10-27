class ProductsController < ApplicationController
  # before_action :find, only: [:show]
  def index
    @products = Product.all
  end
  def show
    
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :stock, :category )
  end

  # before show, edit, update and destroy run this code!
  def find
    @products = Product.find(params[:id])
  end


end
