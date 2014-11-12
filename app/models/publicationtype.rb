class Publicationtype < ActiveRecord::Base
	has_many :publicationsubtypes
	belongs_to :atributelist
end
