class OrdersController < ApplicationController
	before_action :set_order, only: [ :edit, :update, :show]

	def index
		if sort_order == 'all'
			@orders = Order.all		
		else
			@orders = Order.where(is_delivered: sort_order == 'true')
			puts @orders
		end
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
    def sort_order
    	%w(true false).include?(params[:sort]) ? params[:sort] : 'all'
    end
end
