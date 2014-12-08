class Publication < ActiveRecord::Base
	has_many :attribute_values , inverse_of: :publication
	has_many :author_positions , inverse_of: :publication
	has_many :authors , through: :author_positions
	has_many :values, through: :attribute_values
	belongs_to :publication_subtype
	belongs_to :user
	validates :title, :description, :user, :publication_subtype, presence: true

	accepts_nested_attributes_for :author_positions

	def self.form_attributes
		publication_subtype.publication_type.publication_attributes
	end
end
