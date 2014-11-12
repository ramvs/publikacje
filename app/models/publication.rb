class Publication < ActiveRecord::Base
	has_many :attribute_values
	belongs_to :publication_subtype
	belongs_to :user
end
