class Autorlist < ActiveRecord::Base
	belongs_to :autor
	belongs_to :publication
end
