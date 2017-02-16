class Api::V1::UsersController < ApplicationController

  def create
    @user =User.create(user_params)
    if @user.save
      jwt = Auth.encrypt({userid: @user.id}) #new class
      # here, we are sending back the jwt for session storage
      # and the username for displaying it to the user
      render json: {jwt: jwt, username: @user.username}
    else

      # here, we are sending back an error message
      render json: {:errors=>
       [{:detail=>"incorrect email or password",
         :source=>{:pointer=>"user/err_type"}}
       ]}, status: 404
    end
  end

  def login
    @user = User.find_by(username: params["username"]).try(:authenticate, params["password"])
    if @user

      jwt = Auth.encrypt({userid: @user.id})

      # here, we are sending back the jwt for session storage
      # and the username for displaying it to the user
      # the session storage will be sent back later to decrypt
      render json: {jwt: jwt, username: @user.username}
    else

      #when we only send back an empty string,
      # react can know that the login was not authenticated
      render json: {jwt: "", username: ""}
    end
  end

  def the_current_user

    # QUESTION:  When there is no session data,
    # why are we sending a blank header ""
    # just to send back an empty response?
    # Does this make any sense, or should there some other way
    # to determine if there's no sessiondata on the
    # client side?
    session_data_jwt = request.headers['HTTP_AUTHORIZATION']

    # above will be either "" or a string jwt encryted
    # so the response should be determined by that...

    # if the session data is blank...
    if session_data_jwt.length == 0

      render json: {username: "" }

    # else if session data is a jwt string
    else
      hat = Auth.decode(session_data_jwt)
      user = User.find(hat["userid"])
      render json: {username: user.username }
    end

  end


  private

  def user_params
    params.permit(:first_name, :last_name, :username, :password, :password_confirmation)
    # params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
  end

end
