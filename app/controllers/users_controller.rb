class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(set_user)

    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'home'
      

    else
      redirect_to controller: 'users', action: 'new'

    end
  end

  private
  def set_user
    params.require(:user).permit(:name, :password, :passford_confirmation)
  end
end
