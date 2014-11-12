class AutorController < ApplicationController
  def index
  	@autors = Autor.all
  end
end
