class PublicationSubtype < ActiveRecord::Base
	has_many :publications
	belongs_to :publication_type

	def publication_type_name
		if publication_type==nil
			""
		else
			publication_type.name
		end
	end
end
