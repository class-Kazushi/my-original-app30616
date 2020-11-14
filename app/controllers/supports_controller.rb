class SupportsController < ApplicationController

  def index
    @support = Support.new
  end

  def create
    @support = Support.new(support_params)
    if @support.valid?
      pay_support
      @support.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def support_params
    params.permit(:price, :request_id, :token).merge(user_id: current_user.id)
  end

  def pay_support
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: support_params[:price],
      card: support_params[:token],
      currency: 'jpy'
    )
  end
  
end
