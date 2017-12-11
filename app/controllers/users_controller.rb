class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to @user
      sign_in @user
      flash[:success] = "Welcome to the System, #{@user.name}"
      redirect_to @user
      else
      render 'new'
    end
  end


  def destroy
    sign_out
    redirect_to root_url
  end

  def show
      @user = User.find(params[:id])
  end

  def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
      end
end
