class Account < ActiveRecord::Base
	has_many :topics #refers to the topics the user creates 
	has_many :debate_participations # refers to the user's participation in debates
	has_many :comments # A user will create many contents
	has_many :posts
	has_many :debates, :through => :debate_participations
	has_secure_password


	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates_presence_of :first_name
	validates_length_of :first_name, :within => 1..50
	validates_presence_of :last_name
	validates_length_of :last_name, :within => 1..50
	

    validates :email, :presence => true,
				  :length => {:within => 3..50},
				  :uniqueness => true,
				  :format => {:with => EMAIL_REGEX}


	validates :password, :presence => true,
						 :confirmation => true,
						 :length => {:within => 8..32}

	
	scope :search, lambda{|query|
		where(["first_name LIKE ?", "%#{query}%"])}

end
