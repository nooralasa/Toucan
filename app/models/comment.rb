class Comment < ActiveRecord::Base
	has_one :content, as :content_owner
	belongs_to :account
end
