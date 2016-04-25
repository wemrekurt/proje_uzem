class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
     @Users = User.where("email!=?",current_user.email).all
     authorize @Users
  end

  def active_pasive
    @user=User.find(params["id"])
    authorize @user

      if(@user.isActive==true)
        @user.isActive=false
      elsif (@user.isActive==false)
        @user.isActive=true
      end

    @user.save
    redirect_to users_path
  end
end
