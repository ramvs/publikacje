class AttributePosition < ActiveRecord::Base
	belongs_to :publication_type
	belongs_to :attribute
	validates :attribute_id, :publication_type_id, presence: true
end
