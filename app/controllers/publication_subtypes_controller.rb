class PublicationSubtypesController < ApplicationController
  before_action :set_publication_subtype, only: [:show, :edit, :update, :destroy]
  # GET /publication_subtypes
  # GET /publication_subtypes.json
  def index
    @publication_subtypes = PublicationSubtype.all
  end

  # GET /publication_subtypes/1
  # GET /publication_subtypes/1.json
  def show
  end

  # GET /publication_subtypes/new
  def new
    authorize! :create , PublicationSubtype
    @subtype = PublicationSubtype.new
    setup_type_options
  end

  # GET /publication_subtypes/1/edit
  def edit
    authorize! :edit, @subtype
    setup_type_options
  end

  # POST /publication_subtypes
  # POST /publication_subtypes.json
  def create
    authorize! :create , PublicationSubtype
   respond_to do |format|
      @subtype = PublicationSubtype.new(name: params[:name], publication_type_id: PublicationType.getId(params[:kind]))
      if @subtype.save
        format.html { redirect_to publication_subtypes_path, notice: 'Publication subtype was successfully created.' }
        format.json { render :show, status: :created, location: @subtype }
      else
        setup_type_options
        flash[:danger] = @subtype.errors.full_messages
        format.html { render :new }
        format.json { render json: @subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  def update 
    authorize! :edit , @subtype
    @subtype.publication_type_id = PublicationType.getId(params[:kind]) 
    respond_to do |format|
      if @subtype.save
        format.html { redirect_to @subtype, notice: 'Publication subtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @subtype }
      else
        setup_type_options
        format.html { render :edit }
        format.json { render json: @subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publication_subtypes/1
  # DELETE /publication_subtypes/1.json
  def destroy
    authorize! :destroy , @subtype
    @subtype.destroy
    respond_to do |format|
      format.html { redirect_to publication_subtypes_url, notice: 'Publication subtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication_subtype
      @subtype = PublicationSubtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_subtype_params
      params.require(:publication_subtype).permit(:name,:publication_type_id)
    end
    
    def setup_type_options
      @subtype_list = PublicationSubtype.uniq.pluck(:name)
      @type_list = PublicationType.pluck(:name)
    end
end
