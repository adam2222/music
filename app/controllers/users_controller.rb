class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url
      # login(@user)
      # redirect_to music_routes
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end
  
    def show
      @user = User.find(params[:id])
      render :show
    end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
