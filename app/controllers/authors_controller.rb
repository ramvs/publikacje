class AuthorsController < ApplicationController
	def index
		@authors = Author.all
		@dupa = Author.all
	end
end
