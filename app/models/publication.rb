class Publication < ActiveRecord::Base
	has_many :attribute_values , inverse_of: :publication 
	has_many :author_positions , inverse_of: :publication
	has_many :authors , through: :author_positions
	belongs_to :publication_subtype
	belongs_to :user
	validates :title, :description, :user, :publication_subtype, presence: true

	accepts_nested_attributes_for :author_positions
	accepts_nested_attributes_for :attribute_values

	def self.form_attributes
		publication_subtype.publication_type.publication_attributes
	end

	def set_values arguments
		attributes = []
		publication_subtype.get_attributes.each do |attr|
			val = arguments["#{attr.id}"]
			raise "Error. Missing argument for #{attr.name} attribute" if val == nil
			attributes << AttributeValue.new(publication_attribute_id: attr.id, 
				attribute_value: val, publication_id: id)
		end
		self.attribute_values = attributes
	end
end
