class PublicationType < ActiveRecord::Base
	has_many :publication_subtypes
	has_many :attribute_positions
end
