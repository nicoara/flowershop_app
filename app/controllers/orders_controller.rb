class OrdersController < ApplicationController
	before_action :Add view all orders, edit state of order, only: [ :edit, :update, :show]

	def index
		@orders = Order.all
	end

	def show
	end

	def new
		@order = Order.new
	end

	def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

	def update
		#debugger
		respond_to do |format|
    if @order.update(order_params)
      format.html { redirect_to @order, notice: 'Order was successfully updated.' }
      format.json { render :show, status: :ok, location: @order }
    else
      format.html { render :edit }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
    end
	end

	private
	  def set_order
	  	@order = Order.find(params[:id])
	  end
	  def order_params
      params.require(:order).permit(:is_delivered, :nr_roses, :client_name, :delivery_date, :sort)
    end
end
