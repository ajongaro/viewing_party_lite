class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save && validate_passwords
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def validate_passwords
    params[:password] == params[:password_confirmation]
  end
end