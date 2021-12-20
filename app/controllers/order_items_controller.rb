class OrderItemsController < ApplicationController
  before_action :set_cart, only: [:create, :update]
  
  def create
    @order_item = @cart.order_items.find_by product_id: params[:order_item][:product_id]
    
    if @order_item
      flash.now[:notice] = "The product was added to the cart previously."
    else
      @order_item = @cart.order_items.create order_item_params
      flash.now[:notice] = "The product is added to the cart."
    end
    respond_to do |format|
      format.turbo_stream 
    end
  end

  def update
    @order_item = OrderItem.find params[:id]
    @order_item.update quantity: (@order_item.quantity + order_item_params["quantity"].to_i)
    respond_to do |format|
      flash.now[:order] = "#{@order_item.product.name} is updated."
      format.turbo_stream 
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
  
end
