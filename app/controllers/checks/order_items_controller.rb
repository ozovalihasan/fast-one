class Checks::OrderItemsController < ApplicationController
  include ActionView::RecordIdentifier
  
  def index
    @order = current_order
    @order_items = @order.order_items.includes :product
  end
  
  def update
    @cart = current_order
    @order_item = OrderItem.find params[:id]
    @order_item.update order_item_params
    respond_to do |format|
      format.turbo_stream 
    end
  end

  def destroy
    @cart = current_order
    @order_item = OrderItem.find params[:id]
    @order_item.delete
    respond_to do |format|
      format.turbo_stream 
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
  
end
