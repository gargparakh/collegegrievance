class Complaint < ApplicationRecord
	has_many :complaint_updates
	validates :subject, :description, :user_id, presence:true
	attr_accessor :status
	
end
