class Author < ActiveRecord::Base
	belongs_to :user
	has_many :author_positions
 	validates :name, :surname, :email, :academic_degree , presence: true

 	def full_name
 		return "#{academic_degree} #{surname} #{name}"
 	end
end
