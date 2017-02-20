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

  def add_interest

    if add_interest_params[:id] == "submit"
      interest = Interest.find_by(title: add_interest_params[:interest])
    else
      interest = Interest.find(add_interest_params[:id])
    end

    # if the interest exist...
    if interest

      # if the active user doesn't already have this interest...
      if !active_user.interest_ids.include?(interest.id)
        # add the interest to the user
        active_user.interests << interest
        # return the interest
        render json: interest
      else
        # if the active user does have this interest...
        render json: interest, serializer: InterestCheckSerializer
      end
    else
      # create Interest and return it
      new_interest = Interest.create(title: add_interest_params[:interest])

      # add the interest to the user
      active_user.interests << new_interest

      render json: new_interest
    end
  end

  def check_username

    is_valid = !User.find_by(username: params[:input])

    render json: {valid: is_valid}
  end


  private

  def create_user_params
    params.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

  def login_params
    params.permit(:username, :password)
  end

  def add_interest_params
    params.permit(:interest, :id)
  end

end
