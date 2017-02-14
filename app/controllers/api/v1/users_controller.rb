class Api::V1::UsersController < ApplicationController

  def create
    @user =User.create(user_params)
    if @user.save
      jwt = Auth.encrypt({userid: @user.id}) #new class
      render json: {username: @user.username,
                    id: @user.id,
                    first_name: @user.first_name,
                    last_name: @user.last_name
                  }
    else
      render json: {response: "hello world"}
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :password, :password_confirmation)
    # params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
  end

end
