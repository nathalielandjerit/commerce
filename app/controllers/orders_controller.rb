class OrdersController < ApplicationController

    layout 'admin', :except => :new

    before_filter :authorize

    def new
    if current_cart.line_items.empty?
      flash[:info] = "Your cart is empty!"
      redirect_to '/store/index'
    else
      @order = Order.new
      render :layout => 'application'
    end
  end

    def create
        @order = Order.new(params[:order])
        @order.add_line_items_from_card(current_card)
        if @order.save
            Notifier.order_received(@order).deliver          
            session[:card_id] = nil
            flash[:success] = " Merci pour votre commande !"
            redirect_to "/store/index"
        else
            render 'new'
        end
    end

    def index
        @orders = Order.paginate(:page => params[:page], :per_page => 2)
    end

    def show
        @order = Order.find(params[:id])
        @orders = @order.line_items
    end

    def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      flash[:succes] = "This order has been deleted"
      redirect_to orders_url
    else
      flash[:error] = "Order not deleted"
    end
  end

end
