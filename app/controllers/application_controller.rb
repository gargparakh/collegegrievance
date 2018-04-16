class ApplicationController < ActionController::API

  #before_action :set_web_links

  def set_web_links
    @back_end_link = "http://birtsgrievance.herokuapp.com/"
    @front_end_link = ""
  end


private

    def check_user_logged_in
        if request.headers["HTTP_ACCESS_TOKEN"] && request.headers["HTTP_SECRET_KEY"]

          user = ApiKey.where(secret_key: request.headers["HTTP_SECRET_KEY"],
            user_token: request.headers["HTTP_ACCESS_TOKEN"]).first
            if user
              return true
            else
              render json: {status: "error", error_message: "Access denied"}
              return false
            end
        else
          render json: {status: "error", error_message: "Header Access denied"}
          return false
        end
    end

    def check_user_logged_in_as_admin

      if check_user_logged_in
    end
  end

    def get_logged_in_user_id

      user = ApiKey.where(user_token: request.headers["HTTP_ACCESS_TOKEN"],
       secret_key: request.headers["HTTP_SECRET_KEY"]).first
      return user.user_id

    end

    def verified
      if User.find(get_logged_in_user_id).verified
        return true
      else
        render json: {status: "error", error_message: "You are not verified yet."}
        return false
      end
    end
end
