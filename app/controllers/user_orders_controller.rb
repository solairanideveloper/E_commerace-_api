class UserOrdersController < ApplicationController
  before_action :set_user
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = @user.orders.includes(order_items: :product)
  end

  def show; end

  def edit; end

  def update
    if @order.update(order_params)
      redirect_to user_order_path(@user, @order), notice: "Order updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to user_orders_path(@user), notice: "Order deleted successfully."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_order
    @order = @user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(order_items_attributes: [:id, :product_id, :quantity, :_destroy])
  end
end



