class AuthorsController < ApplicationController
	include ApplicationHelper
	before_action :setup_author , only: [:show , :edit ,:update , :destroy]
	def index
		@search = Author.search do
	     	fulltext params[:search] 
	      	paginate( :page => params[:page]||1 )
	      	with :added_by_id, current_user.id  if params[:only_me]=="1" && user_signed_in?
	    end
	   	@authors = @search.results
	end

	def show
		authorize! :read , @author
		@search = Publication.do_search(
			params[:search],params[:publish_at],
			only_current_user(params[:only_me]),@author.id,
			params[:format]=="pdf",params[:page]
		)
		@publications = @search.results
		respond_to do |format|
		    format.pdf do
		        render :pdf => "file_name", 
		        :template => 'publications/index.pdf.erb',
		        :encoding  => "UTF-8"
		    end
		    format.html
		end
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
		@author.create_activity :destroy , info: @author.full_name , owner: current_user
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
