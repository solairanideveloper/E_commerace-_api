class OrdersController < ApplicationController
  def new
    @user = nil
    @users = User.all
    @products = Product.all
  end

  def create
    user = User.find(params[:user_id])
    order = user.orders.build

    params[:items]&.each do |item|
      next if item[:product_id].blank?
      product = Product.find(item[:product_id])
      order.order_items.build(product: product, quantity: item[:quantity])
    end

    if order.save
      redirect_to user_order_path(user, order), notice: "Order placed successfully"
    else
      redirect_to new_order_path, alert: "Error creating order"
    end
  end
end
