class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_product, only: [:show, :destroy]
  

  # GET /products
  def index
    # @products = Product.all
      if params[:query].present?
        @products = Product.search_by_title_and_description("%#{params[:query]}%")
      else
        @products = Product.all
      end
  end
  
  # GET /products/:cheap (collection)
  def cheap
    @products = Product.where("price < 20")
  end

  # GET /products/:id
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
     
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # DELETE /products/:id/delete
  def destroy
    @product.destroy
    # TODO: Find out the correct redirect path to call after deletion
    redirect_to products_path
  end

  private

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:title, :description, :price, :stock, :category, photos: [] )
  end

  # Before show, edit, update and destroy run this code!
  def set_product
    @product = Product.find(params[:id])
  end
end
