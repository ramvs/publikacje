class AttributeValue < ActiveRecord::Base
	belongs_to :publication
	belongs_to :publication_attribute
	validates :value, :publication_id, :publication_attribute_id, presence: true 
end
