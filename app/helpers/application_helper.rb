module ApplicationHelper
  include Pagy::Frontend
  
  def current_order
    order = Order.find_by id: session[:order_id]
    unless order
      order = Order.create consumer_id: User.ids.sample
      session[:order_id] = order.id
    end
    order
  end

  def set_cart
    @cart = current_order
  end

  def signed_in_user?
    seller_signed_in? || consumer_signed_in? || admin_signed_in?
  end

end
