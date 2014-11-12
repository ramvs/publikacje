class AttributeValue < ActiveRecord::Base
	belongs_to :publication
	belongs_to :attribute
end
