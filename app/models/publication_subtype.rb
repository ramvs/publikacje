class PublicationSubtype < ActiveRecord::Base
	has_many :publications
	belongs_to :publication_type

	validates_presence_of :name , :publication_type
	validates_uniqueness_of :name , scope: :publication_type_id 

	def publication_type_name
		if publication_type==nil
			""
		else
			publication_type.name
		end
	end
end
