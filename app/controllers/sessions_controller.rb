class SessionsController < ApplicationController

  def new
    # Redirect to sign-in page
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user.nil?
      flash.now[:errors] = ["Wrong name/password combination"]
      render :new
    else
      login(@user)
      redirect_to user_url(@user.id)
    end
  end


  def destroy
    logout(@user)
    redirect_to new_session_url
  end
end
