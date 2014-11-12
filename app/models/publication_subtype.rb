class PublicationSubtype < ActiveRecord::Base
	has_many :publications
	belongs_to :publication_type
end
