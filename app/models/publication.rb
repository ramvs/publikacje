class Publication < ActiveRecord::Base
	has_many :attribute_values
	belongs_to :publication_subtype
	belongs_to :user
	validates :title, :description, :user_id, :publication_subtype_id, presence: true
end
