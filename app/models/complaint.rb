class Complaint < ApplicationRecord
	belongs_to :user
	has_many :complaint_chat
	validates :subject, :description, :user_id, presence:true
end
