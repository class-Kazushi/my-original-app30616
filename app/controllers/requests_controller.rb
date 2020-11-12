class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @request.update(request_params)
      redirect_to request_path
    else
      render :edit
    end
  end

  def destroy
    if @request.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def request_params
    params.require(:request).permit(:title, :category_id, :content, :url, :job, :want, :period, :reword, :prefecture_id, :city, :people, :donation, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @request = Request.find(params[:id])
    unless @request.user == current_user
      redirect_to action: :index
    end
  end

end
