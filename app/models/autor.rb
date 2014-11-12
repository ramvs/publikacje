class Autor < ActiveRecord::Base
	has_one :user
	
end
