class PublicationAttribute < ActiveRecord::Base
	self.inheritance_column = nil
	has_many :attribute_values , inverse_of: :publication_attribute, :dependent => :destroy
	has_many :attribute_positions, inverse_of: :publication_attribute, :dependent => :destroy
	has_many :pubications ,  inverse_of: :publication_attribute
	validates :name, :type, presence: true

	def self.prepare_select_array
		self.all.order("name ASC").pluck(:name,:id)
	end

	def self.getId name
		attribute = self.where(name: name).first
		if attribute == nil
			attribute = self.new(name: name)
			attribute.save
			return attribute.id
		else
			return attribute.id
		end
	end
end
