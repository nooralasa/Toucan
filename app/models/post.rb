class Post < ActiveRecord::Base
	
	has_one :content, as: :content_owner
    has_many :comments


	belongs_to :debate
	belongs_to :account
	
	#define some methods to make life easier
	scope :newest_first, lambda{order("posts.created_at DESC")}
	scope :newest, lambda{where("posts.created_at MAX")}
end
