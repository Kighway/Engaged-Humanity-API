class Api::V1::UsersController < ApplicationController

  def create
    @user =User.creeate(user_params)
    if @user.save
      jwt = Auth.encrypt({userid: @user.id}) #new class
      render json: {jwt: jwt, name: @user.username}
    else

    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :password, :password_confirmation)
    # params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
  end

end
