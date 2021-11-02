class DealsController < ApplicationController
  before_action :find_product, only: [:new, :create]
  before_action :find_deal, only: [:destroy]

  # GET /deals
  def list_cart
    puts current_user
    @deals = Deal.where(user_id: current_user)
      # if params[:query].present?
      #   @products = Product.search_by_title_and_description("%#{params[:query]}%")
      # else
      #   @products = Product.all
      # end
  end
  # GET /deals
  def list_hist
    puts current_user
    @deals = Deal.where(user_id: current_user)
      # if params[:query].present?
      #   @products = Product.search_by_title_and_description("%#{params[:query]}%")
      # else
      #   @products = Product.all
      # end
  end

  # GET /deals
  def list_finish
    puts current_user
    @deals = Deal.where(user_id: current_user)
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
    @deal = Deal.new(deals_params)
    @deal.product = @product
    @deal.price = @product.price
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

  def destroy
    # authorize @deal
    @deal.destroy
    redirect_to list_cart_path(current_user)
  end

  private

  def deals_params
    params.require(:deal).permit(:quantity)
  end

  def find_product
    @product = policy_scope(Product).find(params[:product_id])
  end

  def find_deal
    @deal = Deal.find(params[:id])
  end

end
