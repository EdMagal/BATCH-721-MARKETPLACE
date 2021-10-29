class DealsController < ApplicationController
  before_action :find_product, only: [:new, :create]

  # GET /deals
  def list_cart
    @deals = Deal.all
      # if params[:query].present?
      #   @products = Product.search_by_title_and_description("%#{params[:query]}%")
      # else
      #   @products = Product.all
      # end
  end

  def new
    @deal = Deal.new
    authorize @deal
  end

  def create
    # @product = Product.find(params[:product_id])
    @deal = Deal.new(deals_params)
    @deal.product = @product
    @deal.user = current_user
    authorize @deal
    if @deal.save
      redirect_to products_path, notice: "Produto adicionado com sucesso."
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
    @product = policy_scope(Product).find(params[:product_id])
  end
end
