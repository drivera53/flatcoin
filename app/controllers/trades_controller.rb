class TradesController < ApplicationController

    get '/trade' do
        if logged_in?
          erb :'trades/pick'
        else
          redirect to '/'
        end
    end

    post '/trade/new_trade' do
        @coin_id = params[:coin_id] 
        redirect to "/trade/#{@coin_id}"
    end

    get '/trade/:id' do
        if logged_in?
          Api.new.get_top_20_cryptocurrencies 
          @coin = Cryptocurrency.find_by_id(params[:id])
          if @coin != nil
            erb :'trades/new'
          else
            redirect to '/'
          end
        else
          redirect to '/'
        end
    end

    post '/trade/status' do
        if params[:quantity].to_i > 0
            @trade = current_user.trades.build(coin_name: params[:coin_name], current_price: params[:current_price], quantity: params[:quantity])
            @new_balance = current_user.balance - (params[:quantity].to_i*params[:current_price].to_f)
            if @new_balance > 0
                current_user.update(balance: @new_balance)
                @trade.save
                erb :'trades/confirmation'
            else
                erb :'trades/rejected'
            end
        else
            redirect to '/'
        end
    end

    get '/trades' do
        if logged_in?
          @trades = Trade.all
          erb :'trades/all'
        else
          redirect to '/'
        end
    end

    get '/trades/edit/:id' do
        if logged_in?
            @trade = Trade.find_by_id(params[:id])
            if @trade && @trade.user == current_user
                erb :'trades/edit'
            else
                redirect to '/users/balance'
            end
        else
            redirect to '/'
        end
    end

    patch '/trades/edit/:id' do
        if logged_in?
            @trade = Trade.find_by_id(params[:id])
            if @trade && @trade.user == current_user
                @trade.update(coin_name: params[:coin_name], current_price: params[:current_price], quantity: params[:quantity])
                redirect to '/users/balance'
            else
                redirect to '/users/balance'
            end
        else
            redirect to '/'
        end
    end

    get '/trades/sell/:id' do
        if logged_in?
            @trade = Trade.find_by_id(params[:id])
            if @trade && @trade.user == current_user
                Api.new.get_top_20_cryptocurrencies
                coin_name = @trade.coin_name
                @updated_coin = Cryptocurrency.find_by_name(coin_name)
                @new_balance = current_user.balance + (@trade.quantity.to_i * @updated_coin.current_price.to_f)
                erb :'trades/sell'
            else
                redirect to '/users/balance'
            end
        else
            redirect to '/'
        end
    end

    delete '/trades/sell/:id/delete' do
        puts params
        if logged_in?
          @trade = Trade.find_by_id(params[:id])
          if @trade && @trade.user == current_user
            current_user.update(balance: params[:new_balance])
            @trade.delete
          end
          redirect to '/users/balance'
        else
          redirect to '/'
        end
    end

    get '/leaderboard' do
        if logged_in?
          @users = User.all
          erb :'trades/leaderboard'
        else
          redirect to '/'
        end
    end

end