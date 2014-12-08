class AttributeValue < ActiveRecord::Base
	belongs_to :publication 
	belongs_to :publication_attribute
	validates :attribute_value, :publication, :publication_attribute, presence: true 
end
