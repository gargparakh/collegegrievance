class AdminUsersController < ApplicationController
  before_action :check_user_logged_in_as_admin, only: [:update_password, :fetch_complaints]

  def create
    admin_user = AdminUser.new(name: params[:name],
                               email: params[:email],
                               phone: params[:phone],
                               designation: params[:designation],
                               password: params[:password])

    if admin_user.save
      render json: {status: "success"}
    else
      render json: {status: "error", error_message: admin_user.errors.full_messages}
    end
  end

  #update password

  def update_password
    if params[:email] && params[:password]
      user = AdminUser.where(email: params[:email]).first

      if user.id == get_logged_in_admin_id
        user.password = params[:password]

        if user.save
          render json: {status: "success"}
        else
          error_message = user.errors.full_messages
        end
      else
        error_message = "user not found"
        render json: {status: "error", error_message: error_message}
      end
    else
      render json: {status: "error", error_message: "params missing"}
    end
  end



  #fetch complaints

  def fetch_complaints
    new_complaints = Complaint.where(status: "pending")
    completed_complaints = Complaint.where(status: "resolved")
    render json: {new_complaint: new_complaints, resolved_complaint: resolved_complaints}
  end

  # Reset user password from link sent to email

  # def reset_password
  #   if params[:access_token] && params[:secret_key] && params[:password]
  #     user_link = PasswordResetLink.where(access_token: params[:access_token],
  #                                         secret_key: params[:secret_key]).first
  #     if user_link
  #       user = AdminUser.find(user_link.user_id)
  #       user.password = params[:password]
  #       if user.save
  #         render json: {status: "success", message: "password changed"}
  #       else
  #         error_message = user.errors.full_messages
  #       end
  #     else
  #       error_message = "User not found"
  #     end
  #   else
  #     error_message = "Invalid Parameters"
  #   end
  #   render json: {status: "error", error_message: error_message}
  # end

  # Request a password reset link on email\

  # def request_password_reset
  #   if params[:email]
  #     user = AdminUser.where(email: params[:email]).first
  #     if user
  #       password_reset_link = PasswordResetLink.new(user_id: user.id)
  #       if password_reset_link.save
  #         #todo: send email
  #         render json: {status: "success", message: "Reset mail sent"} and return
  #       else
  #         error_message = password_reset_link.errors.full_messages
  #       end
  #     else
  #       error_message = "User not found"
  #     end
  #   else
  #     error_message = "Invalid parameters"
  #   end
  #   render json: {status: "error", error_message: error_message}
  # end

  # fetch stats for admin's dashboard

  #   def fetch_statistics
  #     user = AdminUser.find(get_logged_in_user_id)

  #     if user.designation == "principal"
  #       new_complaints = ComplaintStatus.where(admin_user_id: user.id, status: "pending").count
  #       pending_complaints = 0
  #       completed_complaints = ComplaintStatus.where(admin_user_id: user.id, status: "completed").count

  # end

  #     render json: {new_complaint: new_complaints, pending_complaint: pending_complaints, completed_complaint: completed_complaints}
  #   end

  # def fetch_alerts
  #   alerts = Alert.where(admin_user_id: get_logged_in_user_id)
  #   render json: {status: "success", alerts: alerts}
  # end
end
