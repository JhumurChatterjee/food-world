class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), flash: { success: "Welcome! you have been registered successfully." }
    else
      render "new"
    end
  end

  def edit
    user
  end

  def update
    if user.update(user_params)
      redirect_to user_path(@user), flash: { success: "Your Account has been Updated successfully." }
    else
      render "edit"
    end
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :phone_number, :email)
  end
end
