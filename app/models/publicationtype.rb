class Publicationtype < ActiveRecord::Base
	has_many :publicationsubtypes
	has_many :atributelists
end
