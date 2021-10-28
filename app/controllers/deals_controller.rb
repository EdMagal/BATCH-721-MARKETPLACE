class DealsController < ApplicationController
  before_action :find_product, only: [:new, :create]
  
  def new
    @deal = Deal.new
  end
  
  def create
    # @product = Product.find(params[:product_id])
    @deal = Deal.new(deals_params)
    @deal.product = @product
    @deal.user = current_user
    if @deal.save
      redirect_to products_path
    else
      render :new
    end
  end

  # def show
  # end

  # def destroy  
  # end

  private

  def deals_params
    params.require(:deal).permit(:quantity)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end
end
