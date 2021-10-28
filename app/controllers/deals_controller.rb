class DealsController < ApplicationController
  # before_action :find_product [:new, :create]
  
  def new
    @deal = Deal.new
  end
  
  def create
    @product = Product.find(params[:product_id])
    @deal = Deal.new(deals_params)
    @deal.product = @product
    if @deal.valid?
      @deal.save
      redirect_to root
    else
      render :new
    end
  end

  def show
  end

  def destroy  
  end

  private

  def deals_params
    params.require(:deals).permit(:quantity, :finalizado)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end
end
