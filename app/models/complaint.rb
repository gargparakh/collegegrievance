class Complaint < ApplicationRecord
	belongs_to :user
	validates :subject, :description, :user_id, presence:true
end
