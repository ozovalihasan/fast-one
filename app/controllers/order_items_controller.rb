class OrderItemsController < ApplicationController
  def create
    @cart = current_order
    @order_item = @cart.order_items.create order_item_params
    respond_to do |format|
      format.turbo_stream 
    end
  end

  def update
    @cart = current_order
    @order_item = OrderItem.find params[:id]
    @order_item.update quantity: (@order_item.quantity + order_item_params["quantity"].to_i)
    respond_to do |format|
      format.turbo_stream 
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
  
end
