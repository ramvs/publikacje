class AttributePosition < ActiveRecord::Base
	belongs_to :publication_type
	belongs_to :publication_attribute
	validates :publication_attribute, :publication_type, presence: true
end
