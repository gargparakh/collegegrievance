class ComplaintsController < ApplicationController
  before_action :check_user_logged_in, :verified, only: [:create_complaint, :show_user_complaints, :show_user_resolved_complaints]
  before_action :check_user_logged_in_as_admin, only: [:pending_complaint_list, :resolved_complaint_list, :resolve_complaint]

  def create_complaint
    complaint = Complaint.new(subject: params[:subject],
                              description: params[:description],
                              image: params[:image],
                              user_id: get_logged_in_user_id,
                              status: "pending",
                              resolved: "Conclusion")

    if complaint.save
      render json: {status: "success", complaint: complaint}
    else
      render json: {status: "error", error_message: complaint.errors.full_messages}
    end
  end

  def show_user_complaints
    user_id = get_logged_in_user_id
    complaints = Complaint.where(user_id: user_id, status: "pending")
    render json: complaints, methods: [:status]
  end

  def show_user_resolved_complaints
    user_id = get_logged_in_user_id
    complaints = Complaint.where(user_id: user_id, status: "resolved")

    render json: complaints, methods: [:status]
  end

  # get complaint by complaint id
  def show_complaint_by_id
    complaint = Complaint.find(params[:id])
    if complaint
      render json: complaint, methods: [:status]
    else
      render json: {status: "error", error_message: "complaint not found"}
    end
  end

  def pending_complaint_list
    complaints = Complaint.where(status: "pending")
    if complaints
      render json: complaints, methods: [:status]
    else
      render json: {status: "error", error_message: "complaint not found"}
    end
  end

  def resolved_complaint_list
    complaints = Complaint.where(status: "resolved")
    if complaints
      render json: complaints, methods: [:status]
    else
      render json: {status: "error", error_message: "complaint not found"}
    end
  end

  def get_updates
    if params[:complaint_id]
      updates = ComplaintUpdate.where(complaint_id: params[:complaint_id])
      render json: {status: "success", updates: updates}
    else
      render json: {status: "error", error_message: "params missing"}
    end
  end

  def resolve_complaint
    if params[:complaint_id]
      complaint= Complaint.find(params[:complaint_id])
      complaint.status = "resolved"
      complaint.resolved = params[:resolved]
    
      if complaint.save
        render json: {status: "success", message: "Update succesfull"}
      else
        render json: {status: "error", error_message: "database not reachable"}
      end
    else
      render json: {status: "error", error_message: "params missing"}
    end
  end

  # def mark_finished
  #   if params[:complaint_id]
  #     complaint_update = ComplaintUpdate.new(complaint_id: params[:complaint_id],
  #                                            assigned_to: "Completed!",
  #                                            notes: "Please raise an alert if anything goes wrong")

  #     complaint_status = ComplaintStatus.where(complaint_id: params[:complaint_id]).first

  #     complaint_status.status = "completed"

  #     if complaint_status.save && complaint_update.save
  #       render json: {status: "success", message: "Update succesfull"}
  #     else
  #       render json: {status: "error", error_message: "database not reachable"}
  #     end
  #   else
  #     render json: {status: "error", error_message: "params missing"}
  #   end
  # end
end
