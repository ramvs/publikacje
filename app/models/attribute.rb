class Attribute < ActiveRecord::Base
	self.inheritance_column = nil
	has_many :attribute_values
	has_many :attribute_positions
	validates :name, :type, presence: true
end
