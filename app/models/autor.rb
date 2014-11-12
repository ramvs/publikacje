class Autor < ActiveRecord::Base
	has_one :user

	validates :user, uniqueness: true
end
