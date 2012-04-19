require "digest/sha2"

class User < ActiveRecord::Base

	attr_reader :password
	attr_accessor :password_confirmation

	validates :email, :presence => true, :uniqueness => true
	validates :password, :confirmation => true
	validate :password_must_be_present

	def self.authenticate(email, password)
		if user = User.find_by_email(email)
			if user.hashed_password == User.encrypt_password(password, user.salt)
				user
			end
		end
	end

	def self.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "hahahatesnique" + salt)
	end

	def password=(pwd)
		@password = pwd
		if self.password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(self.password, self.salt)
		end
	end

	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end

	private
		def password_must_be_present
			errors.add(:password, "Missing Password") unless hashed_password.present?
		end

end
