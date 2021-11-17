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

  def signed_in_user
    current_seller || current_consumer || current_admin
  end

  def signed_in_user?
    signed_in_user.present?
  end
end
