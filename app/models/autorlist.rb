class Autorlist < ActiveRecord::Base
	has_many :autors
	has_many :publications
end
