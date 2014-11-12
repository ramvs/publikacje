class Publication < ActiveRecord::Base
	has_many :autorlists
	belongs_to :user
	has_many :atributevalues
end
