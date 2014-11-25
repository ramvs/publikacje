class Author < ActiveRecord::Base
	belongs_to :user
	has_many :author_positions
 	validates :name, :surname, :email, :academic_degree , presence: true
end
