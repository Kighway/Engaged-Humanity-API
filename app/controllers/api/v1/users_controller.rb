class Api::V1::UsersController < ApplicationController

  def create
    @user =User.create(user_params)

    # if the user is valid...
    if @user.save
      # encrypt the user_id...
      jwt = Auth.encrypt({userid: @user.id})

      # and send it back as a response with the username
      # the jwt will be set to session storage
      # the username will be set to currentUser in the store
      render json: {jwt: jwt, username: @user.username}
    else

      # here, we are sending back an error message
      # that we are not handling yet
      # if the create user fails
      render json: {:errors=>
       [{:detail=>"incorrect email or password",
         :source=>{:pointer=>"user/err_type"}}
       ]}, status: 404
    end
  end

  def login
    # authenticate the user
    @user = User.find_by(username: params["username"]).try(:authenticate, params["password"])

    # if the login is valid...
    if @user
      jwt = Auth.encrypt({userid: @user.id})

      # send the jwt string and username as a response
      render json: {jwt: jwt, username: @user.username}
    else

      #when we only send back an empty string,
      # react can know that the login was not authenticated
      render json: {jwt: "", username: "", error: "username and/or password not valid"}
    end
  end



  def the_current_user

    # Currently, when there is no session data,
    # we're sending a blank header ""
    # just to send back an empty response...

    # We should probably just handle this on the client side.

    session_data_jwt = request.headers['HTTP_AUTHORIZATION']

    # above will be either "" or a string jwt encryted

    # if the session data is blank...
    if session_data_jwt.length == 0

      render json: {username: "" }

    # else if session data is a jwt string
    else
      jwt_user_id = Auth.decode(session_data_jwt)
      user = User.find(jwt_user_id["userid"])
      render json: user
    end

  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end

end
