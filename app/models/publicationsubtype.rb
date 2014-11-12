class Publicationsubtype < ActiveRecord::Base
	belongs_to :publicationtype
	has_many :publications
end
