class PublicationSubtypesController < ApplicationController
  before_action :set_publication_subtype, only: [:show, :edit, :update, :destroy]
  before_action :setup_subtype , only: [:create , :update]
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
    @publication_subtype = PublicationSubtype.new
    @subtype_list = PublicationSubtype.pluck(:name)
    @type_list = PublicationType.pluck(:name)
  end

  # GET /publication_subtypes/1/edit
  def edit
    @publication_subtype = PublicationSubtype.find(params[:id])
    @subtype_list = PublicationSubtype.pluck(:name)
    @type_list = PublicationType.pluck(:name)
  end

  # POST /publication_subtypes
  # POST /publication_subtypes.json
  def create
   respond_to do |format|
      if @subtype.save
        format.html { redirect_to publication_subtypes_path, notice: 'Publication subtype was successfully created.' }
        format.json { render :show, status: :created, location: @subtype }
      else
        format.html { render :new }
        format.json { render json: @subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publication_subtypes/1
  # PATCH/PUT /publication_subtypes/1.json
  def update
    respond_to do |format|
      if @subtype.save
        format.html { redirect_to @subtype, notice: 'Publication subtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @subtype }
      else
        format.html { render :edit }
        format.json { render json: @subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publication_subtypes/1
  # DELETE /publication_subtypes/1.json
  def destroy
    @publication_subtype.destroy
    respond_to do |format|
      format.html { redirect_to publication_subtypes_url, notice: 'Publication subtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication_subtype
      @publication_subtype = PublicationSubtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_subtype_params
      params.require(:publication_subtype).permit(:name,:publication_type_id)
    end

    def setup_subtype
      @subtype = PublicationSubtype.new
      @subtype.name = params[:name]
      type = PublicationType.where(name: params[:kind]).limit(1)
      if type == nil
        type = PublicationType.new(name: params[:kind])
      else
        type = type.first
      end
      @subtype.publication_type = type
    end
end
