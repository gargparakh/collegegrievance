class Complaint < ApplicationRecord

	validates :subject, :description, :user_id, presence:true
	attr_accessor :status
	
end
