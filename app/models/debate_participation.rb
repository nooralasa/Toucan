class DebateParticipation < ActiveRecord::Base
	belongs_to :account
	belongs_to :debate
end
