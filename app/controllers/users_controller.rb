class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if !params[:user][:name] || params[:user][:name] == ''
      flash[:alert] = "Name must be proivided."
      redirect_to 'login_path'
    else
        @user = User.create(set_user)
        session[:user_id] = @user.id
        if params[:user][:password] == params[:user][:password_confirmation]
          @user.password = params[:user][:password]
        else
          redirect_to 'login_path'
        end

      redirect_to 'root'
    end
  end

  private
  def set_user
    params.require(:user).permit(:name, :password, :passford_confirmation)
  end
end
