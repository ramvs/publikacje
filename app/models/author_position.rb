class AuthorPosition < ActiveRecord::Base
	belongs_to :publication
	belongs_to :author
 	validate :main, :publication_id, :author_id, presence: true 
    validates_uniqueness_of :author_id, scope: :publication_id
end
