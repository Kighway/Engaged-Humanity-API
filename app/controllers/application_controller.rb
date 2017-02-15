class ApplicationController < ActionController::API

  def active_user
    token = request.headers["HTTP_AUTHORIZATION"]
      if token
        user_info = Auth.decode(token)
        @active_user ||= User.find_by(id: user_info["userid"])
      end
    end

end
