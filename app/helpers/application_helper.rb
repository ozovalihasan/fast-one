module ApplicationHelper
  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.create consumer_id: User.ids.sample
    end
  end
end
