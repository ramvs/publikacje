class Publication < ActiveRecord::Base
	belongs_to :autorlist
	belongs_to :user
	has_many :atributevalues
end
