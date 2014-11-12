class AttributePosition < ActiveRecord::Base
	belongs_to :publication_type
	belongs_to :attribute
end
