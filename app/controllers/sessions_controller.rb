class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id, notice: "Awesome"
      redirect_to root_path
    else
      flash[:alert] = "Sorry"
      render :new
    end
  end
end
