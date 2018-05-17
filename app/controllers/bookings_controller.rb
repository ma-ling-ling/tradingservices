class BookingsController < ApplicationController

  def recipient_history
  	 @orders = Order.where(user_id: current_user.id).order(created_at: :desc)
  	 @line_items = LineItem.all 
  end

  def provider_history
  	@services_provided = Service.where(user_id: current_user.id).order(created_at: :desc)
  	@line_items = LineItem.all 
  	@orders = Order.all 
  end

end
