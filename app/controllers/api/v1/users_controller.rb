class Api::V1::UsersController < ApplicationController

  def create
    user =User.create(create_user_params)

    # if the user is valid...
    if user.save
      render json: user, serializer: UserWithNewJwtSerializer
    else
      render json: { error: "incorrect email or password"}
    end
  end

  def login
    # authenticate the user
    user = User.find_by(username: login_params[:username]).try(:authenticate, login_params[:password])

    # if the login is valid...
    if user
      render json: user, serializer: UserWithNewJwtSerializer
    else
      render json: {error: "username and/or password not valid"}
    end
  end

  def the_current_user
    session_data_jwt = request.headers['HTTP_AUTHORIZATION']

    if session_data_jwt.length == 0
      render json: {error: "the_current_user should not have been called from react." }
    else
      jwt_user_id = Auth.decode(session_data_jwt)
      user = User.find(jwt_user_id["userid"])
      render json: user
    end

  end

  private

  def create_user_params
    params.permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end

  def login_params
    params.permit(:username, :password)
  end
end
