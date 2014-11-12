class Atributelist < ActiveRecord::Base
	has_many :atributs
	has_many :publicationtype
end
