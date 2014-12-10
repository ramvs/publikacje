class Author < ActiveRecord::Base

	include PublicActivity::Model
  	tracked except: :destroy, owner: Proc.new{ |controller, model| controller.current_user }

	belongs_to :user
	belongs_to :owner , class_name: "User" , foreign_key: :added_by_id
	has_many :author_positions, inverse_of: :author
	has_many :publications, through: :author_positions
 	validates :name, :surname, :email, :academic_degree , presence: true

 	default_scope {order('surname ASC')}

 	searchable do
		text :name, :surname , :email , :academic_degree
		integer :user_id
		integer :added_by_id
		integer :publication_ids , multiple: true do
			publications.map(&:id)
		end
		time :created_at
	end


 	def full_name
 		return "#{academic_degree} #{surname} #{name}"
 	end

 	def biblio_name
 		return "#{surname} #{name[0]}."
 	end

 	def self.prepare_seletc_array
 		authors = Author.all.order("surname ASC")
 		ary = Array.new
 		authors.each do |a|
 			ary<<[a.full_name,a.id]
 		end
 		return ary
 	end

 	def news_feed 

 	end
end
