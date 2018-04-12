class ComplaintChatsController < ApplicationController
  before_action :set_complaint_chat, only: [:show, :update, :destroy]

  # GET /complaint_chats
  def index
    @complaint_chats = ComplaintChat.all

    render json: @complaint_chats
  end

  # GET /complaint_chats/1
  def show
    render json: @complaint_chat
  end

  # POST /complaint_chats
  def create
    @complaint_chat = ComplaintChat.new(complaint_chat_params)

    if @complaint_chat.save
      render json: @complaint_chat, status: :created, location: @complaint_chat
    else
      render json: @complaint_chat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /complaint_chats/1
  def update
    if @complaint_chat.update(complaint_chat_params)
      render json: @complaint_chat
    else
      render json: @complaint_chat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /complaint_chats/1
  def destroy
    @complaint_chat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint_chat
      @complaint_chat = ComplaintChat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def complaint_chat_params
      params.fetch(:complaint_chat, {})
    end
end
