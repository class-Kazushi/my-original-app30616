class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @requests = user.requests
    @nickname = user.nickname
    @real_name = user.family_name + user.first_name
    @real_kana = user.family_kana + user.first_kana
    @email = user.email
    @gender = user.gender.name
    @age = user.age
    @occupation = user.occupation.name
    @ability = user.ability
    @introduction = user.introduction

    @today = Date.today
  end
end
