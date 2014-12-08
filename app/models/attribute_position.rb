class AttributePosition < ActiveRecord::Base
	belongs_to :publication_type
	belongs_to :publication_attribute
	validates :publication_attribute_id, :publication_type_id, presence: true
	self.inheritance_column = nil
end
