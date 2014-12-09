class Publication < ActiveRecord::Base
	has_many :attribute_values , inverse_of: :publication , :dependent => :destroy
	has_many :author_positions , inverse_of: :publication
	has_many :authors , through: :author_positions
	belongs_to :publication_subtype
	belongs_to :user
	validates :title, :description, :user, :publication_subtype, presence: true

	accepts_nested_attributes_for :author_positions
	accepts_nested_attributes_for :attribute_values

	searchable do
		text :title
		text :description
		text :authors do
			authors.map {|author| author.full_name}
		end
		text :type do
			publication_subtype.full_name
		end
	end

	def self.form_attributes
		publication_subtype.publication_type.publication_attributes
	end

	def biblio_authors
		string = ""
		authors.each do |a|
			string+=a.biblio_name+" "
		end
		return string
	end

	def set_values arguments
		attributes = []
		publication_subtype.get_attributes.each do |attr|
			val = arguments["#{attr.id}"]
			raise "Error. Missing argument for #{attr.name} attribute" if val == nil

			#value = attribute_values.where(publication_attribute: attr).first

			#if value == nil
				value = AttributeValue.new(publication_attribute: attr, 
				attribute_value: val, publication: self)
			#end

			attributes << value
		end
		attribute_values = []
		self.attribute_values = attributes
	end

	
end
