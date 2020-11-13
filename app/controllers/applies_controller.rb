class AppliesController < ApplicationController

  def new
    @apply = Apply.new
  end

  def create
    @apply = Apply.new(apply_params)
    if @apply.save
      redirect_to root_path, notice: "応募が完了しました！！"
    else
      render :new
    end
  end

  private
  def apply_params
    params.permit(:phone_num, :reason, :question).merge(user_id: current_user.id, request_id: params[:request_id])
  end

end
