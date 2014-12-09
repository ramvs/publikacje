class PublicationsController < ApplicationController
  
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  #
  # GET /publications
  # GET /publications.json
  def index
    #@publications = Publication.all
    @search = Publication.search do
      fulltext params[:search] do
        phrase_fields title: 3.0
        fields(:authors,:title,:type)
      end
    end
    @publications = @search.results
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    @publication = Publication.find(params[:id])
  end

  # GET /publications/new
  def new
    @publication = Publication.new
    @authors = Author.prepare_seletc_array
    @types = PublicationType.prepare_type_list
    @selected = []
    @type = []
  end

  def params_list_new
    @subtype = PublicationSubtype.find(params[:subtype])
    @values = []
    respond_to do |format|
      format.js
    end
  end

  def params_list
    @subtype = PublicationSubtype.find(params[:subtype])
    publication = Publication.find(params[:publication])
    if publication.publication_subtype.id == @subtype.id
      @values = publication.attribute_values.pluck(:publication_attribute_id,:attribute_value)
    else
      @values=[]
    end
     respond_to do |format|
      format.js {render 'params_list_new'}
    end
  end

  # GET /publications/1/edit
  def edit
    @publication = Publication.find(params[:id])
    @authors = Author.prepare_seletc_array
    @types = PublicationType.prepare_type_list
    @type = @publication.publication_subtype.id
    @selected = @publication.authors.pluck(:id)
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)
    @publication.user_id = current_user.id
    @publication.authors = Author.where(id: params[:publication][:authors][:id])
    @publication.set_values params[:attribute]
    respond_to do |format|
      if @publication.save
        format.html { redirect_to publications_path, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        @authors = Author.prepare_seletc_array
        @types = PublicationType.prepare_type_list
        flash[:danger] = @publication.errors.full_messages
        @type = params[:publication][:publication_subtype_id]
        @selected = params[:publication][:authors][:id]
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    @publication.attributes = publication_params
    @publication.authors = Author.where(id: params[:publication][:authors][:id])
    @publication.set_values params[:attribute]
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
        params.require(:publication).permit(:title, :description, :publication_subtype_id)
    end
end
#