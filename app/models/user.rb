class User < ApplicationRecord

	has_many :complaints, dependent: :destroy
		before_save { self.email = email.downcase }
		before_save { self.enroll_no = enroll_no.downcase }
		validates :name, presence: true
		validates :enroll_no, presence: true,  uniqueness: { case_sensitive: false }
		VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		validates :email, presence: true, length: { maximum: 255 },
    	              format: { with: VALID_EMAIL_REGEX },
        	          uniqueness: { case_sensitive: false }
		validates :password_digest, presence: true
		has_secure_password
		#validates :branch, presence: true
		#validates :semester, presence: true
		# validates_length_of :enroll_no, minimum: 12, maximum: 13
	  validates_length_of :contact, minimum: 10, maximum: 10, allow_blank: true
end
