class Api::OrdersController < ApplicationController

  before_action :set_order, only: [:show, :destroy]
  skip_before_action :verify_authenticity_token

  # GET api/orders
  def index
    @api_orders = Order.all
    render json: @api_orders
  end

  # GET api/orders/1
  def show
    render json: @api_order
  end
  
  # GET api/orders/new
  def new
    @api_order = Order.new
  end

  def create
    @api_order = Order.new(order_params)

    if @api_order.save
      render json: @api_order, status: :created, location: @api_order
    else
      render json: @api_order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @api_order.destroy
    render json: { success: true }, status: 204
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @api_order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:FLName, :phone, :DescriptionCargo, :PointA, :PointB)
  end
end
