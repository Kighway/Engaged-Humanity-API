class Api::V1::UsersController < ApplicationController

  def create
    @user =User.create(user_params)
    if @user.save
      jwt = Auth.encrypt({userid: @user.id}) #new class
      render json: {jwt: jwt}
    else
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
      render json: {jwt: jwt}
    else
      render json: {jwt: ""}
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :password, :password_confirmation)
    # params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
  end

end
