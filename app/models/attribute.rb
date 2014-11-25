class Attribute < ActiveRecord::Base
	has_many :attribute_values
	has_many :attribute_positions
	validates :name, :type, presence: true
end
