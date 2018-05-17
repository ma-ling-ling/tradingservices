class CartController < ApplicationController
  before_action :authenticate_user!, only: [:checkout]

  def add_to_cart
    # some ideas before creating a new "cart_item" table.....
    # order = Order.last ||= Order.new
    # line_item = LineItem.new
    # line_item.order_id = order.id

  if params[:quantity].blank?     # fixing error if pushing "add to cart" button without entering quantity. (see p.65-68 of ecommerce)
    flash[:error] = "Please enter the number of hours that you would like to book."
    redirect_to root_url
  else
      cart_item = CartItem.new
    	cart_item.service_id = params[:service_id]
    	cart_item.hours_ordered = params[:hours_ordered]
    	cart_item.message_to_provider = params[:message_to_provider]
    	cart_item.cart_item_total = cart_item.service.point_value * cart_item.hours_ordered
    	cart_item.save

      redirect_to view_cart_path
    end

  end

  def delete_from_cart
    CartItem.find(params[:cart_item_id]).destroy
    
    redirect_to view_cart_path
  end


  def view_cart
    @cart_items = CartItem.all
  end

  def checkout
    @order = Order.create(user_id: current_user.id, subtotal: 0)

    cart_items = CartItem.all

    cart_items.each do |cartitem|   #save each cart_item into a line_item that will peresist to database (cart_items will get deleted after checkout)
      line_item = LineItem.new
      line_item.service_id = cartitem.service_id
      line_item.hours_ordered = cartitem.hours_ordered
      line_item.line_item_total = cartitem.cart_item_total
      line_item.message_to_provider = cartitem.message_to_provider
      line_item.order_id = @order.id 
      line_item.save 

   #   @order.line_items_id.push(line_item.id)        #logic for orders
      @order.subtotal += line_item.line_item_total
    end 

    @order.fees = 0
    @order.grand_total = @order.subtotal + @order.fees 
    @order.save 

    @line_items = LineItem.all
  end

  def complete_order
  
    current_user.point_bank = current_user.point_bank - params[:point_exchange].to_i
    current_user.save

    CartItem.destroy_all

    @line_items = LineItem.all 
    @line_items.each do |item|   
      if item.order_id == params[:order_id].to_i
        item.service.user.point_bank += item.line_item_total
        item.service.user.save 
        
      end
    end
  end

end
