class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:alert] = "Please confirm the password"
      return redirect_to controller: 'users', action: 'new'
    end
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'home'
      

    else
      redirect_to controller: 'users', action: 'new'

    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :passford_confirmation)
  end
end
