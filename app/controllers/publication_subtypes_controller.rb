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
    @publication_subtype = PublicationSubtype.new
  end

  # GET /publication_subtypes/1/edit
  def edit
  end

  # POST /publication_subtypes
  # POST /publication_subtypes.json
  def create
    @publication_subtype = PublicationSubtype.new(publication_subtype_params)

    respond_to do |format|
      if @publication_subtype.save
        format.html { redirect_to publication_subtypes_path, notice: 'Publication subtype was successfully created.' }
        format.json { render :show, status: :created, location: @publication_subtype }
      else
        format.html { render :new }
        format.json { render json: @publication_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publication_subtypes/1
  # PATCH/PUT /publication_subtypes/1.json
  def update
    respond_to do |format|
      if @publication_subtype.update(publication_subtype_params)
        format.html { redirect_to @publication_subtype, notice: 'Publication subtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication_subtype }
      else
        format.html { render :edit }
        format.json { render json: @publication_subtype.errors, status: :unprocessable_entity }
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
end
