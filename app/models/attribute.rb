class Attribute < ActiveRecord::Base
	has_many :attributelists
	has_many :attributevalues
end
