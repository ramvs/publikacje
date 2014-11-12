class Atribut < ActiveRecord::Base
	belongs_to :atributelist
	belongs_to :atributevalue
end
