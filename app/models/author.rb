class Author < ActiveRecord::Base
	belongs_to :user
	has_many :author_positions
 	validates :name, :surname, :email, :academic_degree , presence: true

 	def full_name
 		return "#{academic_degree} #{surname} #{name}"
 	end

 	def self.prepare_seletc_array
 		authors = Author.all
 		ary = Array.new
 		authors.each do |a|
 			ary<<[a.full_name,a.id]
 		end
 		return ary
 	end
end
