class Checks::OrderItemsController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_cart, only: [:index, :update, :destroy]
  
  def index
    @order_items = @cart.order_items.includes :product
  end
  
  def update
    @order_item = OrderItem.find params[:id]
    @order_item.update order_item_params
    respond_to do |format|
      format.turbo_stream 
    end
  end

  def destroy
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
