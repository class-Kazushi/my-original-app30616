class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @requests = Request.order('created_at DESC')
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  private
  def request_params
    params.require(:request).permit(:title, :category_id, :content, :url, :job, :want, :period, :reword, :prefecture_id, :city, :people, :donation, :image).merge(user_id: current_user.id)
  end

end
