class AppliesController < ApplicationController

  def new
    @apply = Apply.new
  end

  def create
    @apply = Apply.new(apply_params)
    if @apply.save
      redirect_to request_path(@apply.request)
    else
      render :new
    end
  end

  private
  def apply_params
    params.permit(:phone_num, :reason, :question).merge(user_id: current_user.id, request_id: params[:request_id])
  end

end
