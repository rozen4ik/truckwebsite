class OrdersController < ApplicationController

  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def edit
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to new_order_path, success: 'Заказ принят, скоро с вами свяжутся.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, success: 'Статус заказа был изменён.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, success: 'Заказ успешно удалён.' }
      format.json { head :no_content }
    end
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:fl_name, :phone, :description_cargo, :point_a, :point_b, :status)
    end
end
