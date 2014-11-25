class AttributeValue < ActiveRecord::Base
	belongs_to :publication
	belongs_to :attribute
	validates :value, :publication_id, :attribute_id, presence: true 
end
