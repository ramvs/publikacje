class PublicationSubtype < ActiveRecord::Base
	has_many :publications , inverse_of: :publication_subtype, :dependent => :destroy
	belongs_to :publication_type

	validates_presence_of :publication_type
	validates_uniqueness_of :name , scope: :publication_type_id 

	def publication_type_name
		if publication_type.present?
			publication_type.name
		else
			""
		end
	end

	def get_attributes
		publication_type.publication_attributes
	end

	def full_name
		if name && name.length > 0
			return "#{publication_type_name} - #{name}"
		else
			return publication_type_name
		end
	end

end
