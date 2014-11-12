class Atributevalue < ActiveRecord::Base
	has_many :atributs
	belongs_to :publication
end
