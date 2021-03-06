class UsersController < ApplicationController
  before_action :check_user_logged_in, only: [:update_password]
  before_action :check_user_logged_in_as_admin, only: [:verify_user, :unverified_user_list, :verified_user_list ]
  def create
    user = User.new(name: params[:name],
                    contact: params[:contact],
                    email: params[:email],
                    password: params[:password],
                    enroll_no: params[:enroll_no],
                    branch: params[:branch],
                    semester: params[:semester],
                    verified: "false")

    if user.save
      render json: {status: "success", message: "successfully signup"}
    else
      render json: {status: "error", error_message: user.errors.full_messages}
    end
  end

  #Check user is verified or not
  def verified
    if User.find(get_logged_in_user_id).verified
      return true
    else
      render json: {status: "error", error_message: "You are not verified yet."}
      return false
    end
  end
  #Verify the user

  def verify_user
    if params[:user_id]
      user = User.find(params[:user_id])
      user.verified = "true"
      if user.save
        render json: {status: "success"}
      else
        error_message = user.errors.full_messages
      end
    else
      render json: {status: "error", error_message: "params missing"}
    end
  end

  #unverified_user_list for admins
  def unverified_user_list
    users = User.where(verified: "false")
    if users
      render json: users
    else
      render json: {status: "error", error_message: "Users not found"}
    end
  end


  #verified_user_list for admin
  def verified_user_list
    users = User.where(verified: "true")
    if users
      render json: users
    else
      render json: {status: "error", error_message: "Users not found"}
    end
  end


  def update_password
    if params[:old_password] && params[:new_password]
      user = User.find(get_logged_in_user_id)

      if user && user.authenticate(params[:old_password])
        if user.authenticate(params[:new_password])
          render json: {status: "error", error_message: "old password and new password can't be the same!"} and return
        end

        user = User.find(get_logged_in_user_id)
        user.password = params[:new_password]

        if user.save
          render json: {status: "success"}
        else
          error_message = user.errors.full_messages
          render json: {status: "error", error_message: error_message}
        end
      else
        error_message = "Old password is incorrect"
        render json: {status: "error", error_message: error_message}
      end
    else
      render json: {status: "error", error_message: "params missing"}
    end
  end

  # def reset_password
  #   if params[:access_token] && params[:secret_key] && params[:password]
  #     user_link = PasswordResetLink.where(access_token: params[:access_token], secret_key: params[:secret_key]).first
  #     if user_link
  #       user = User.find(user_link.user_id)
  #       user.password = params[:password]
  #       if user.save
  #         render json: {status: "success", message: "Password changed"}
  #       else
  #         error_message = user.errors.full_messages
  #       end
  #     else
  #       error_message = "User not found"
  #     end
  #   else
  #     error_message = "Invalid parameters"
  #   end
  #   render json: {status: "Error", error_message: error_message}
  # end

  # Request a password reset link on email
  # def request_password_reset
  #   if params[:email]
  #     user = User.where(email: params[:email]).first
  #     if user
  #       password_reset_link = PasswordResetLink.new(user_id: user.id)
  #       if password_reset_link.save
  #         #send email
  #         render json: {status: "success", message: "Reset mail sent"} and return
  #       else
  #         error_message = password_reset_link.errors.full_messages
  #       end
  #     else
  #       error_message = "User not found"
  #     end
  #   else
  #     error_message = "Error invalid parameters"
  #   end
  #   render json: {status: "Error", error_message: error_message}
  # end
end
