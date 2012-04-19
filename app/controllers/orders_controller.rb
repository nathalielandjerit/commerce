class OrdersController < ApplicationController

    layout 'admin'

    def new
        if current_card.line_items.empty?
            redirect_to '/store/index', :notice => "Votre panier est vide"
        else
            @order = Order.new
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

end
