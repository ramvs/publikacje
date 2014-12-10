class AuthorsController < ApplicationController
	before_action :setup_author , only: [:show , :edit ,:update , :destroy]

	def index
		@authors = Author.all.order("surname ASC")
	end

	def show
		authorize! :read , @author
	end

	def edit
		authorize! :edit , @author
	end

	def new
		authorize! :create , Author
		@author = Author.new
	end

	def update
		authorize! :edit , @author
		if @author.update_attributes(author_params)
			redirect_to @author , notice: "Dane autora zostały zaktualizowane"
		else
			render :edit
		end
	end

	def create
		authorize! :create , Author
		@author = Author.new(author_params)
		@author.owner = current_user
		if @author.save
			redirect_to authors_path , notice: "Autor został pomyślnie utworzony"
		else
			render 'new'
		end
	end

	def destroy
		authorize! :destroy , @author
		if @author.destroy
			redirect_to authors_path , notice: "Autor został usunięty"
		else
			redirect_to @author , danger: "Nie można usunąć"
		end
	end

	private

		def setup_author
			@author = Author.find(params[:id])
		end

		def author_params
			params.require(:author).permit(:name,:surname,:academic_degree,:email)
		end
end
