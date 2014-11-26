class Author < ActiveRecord::Base
	belongs_to :user
	has_many :author_positions, inverse_of: :author
	has_many :publications, through: :author_positions
 	validates :name, :surname, :email, :academic_degree , presence: true


 	def full_name
 		return "#{academic_degree} #{surname} #{name}"
 	end

 	def self.prepare_seletc_array
 		authors = Author.all.order("surname ASC")
 		ary = Array.new
 		authors.each do |a|
 			ary<<[a.full_name,a.id]
 		end
 		return ary
 	end
end
