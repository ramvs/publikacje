class PublicationTypesController < ApplicationController
  before_action :set_publication_type, only: [:show, :edit, :update, :destroy]

  # GET /publication_types
  # GET /publication_types.json
  def index
    @publication_types = PublicationType.all.order("name ASC")
  end

  # GET /publication_types/1
  # GET /publication_types/1.json
  def show
  end

  # GET /publication_types/new
  def new
    authorize! :create , PublicationType
    @publication_type = PublicationType.new
    @attrs = PublicationAttribute.prepare_select_array
    @selected = []
  end

  # GET /publication_types/1/edit
  def edit
    authorize! :edit , @publication_type
    @attrs = PublicationAttribute.prepare_select_array
    @selected = @publication_type.publication_attributes.pluck(:id)
  end

  # POST /publication_types
  # POST /publication_types.json
  def create
    authorize! :create , PublicationType
    @publication_type = PublicationType.new(publication_type_params)
    @publication_type.publication_attributes = attributes_list_param
    respond_to do |format|
      if @publication_type.save
        format.html { redirect_to @publication_type, notice: 'Publication type was successfully created.' }
        format.json { render :show, status: :created, location: @publication_type }
      else
        @attrs = PublicationAttribute.prepare_select_array
        @selected = params[:publication_type][:publication_attributes][:id]
        format.html { render :new }
        format.json { render json: @publication_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publication_types/1
  # PATCH/PUT /publication_types/1.json
  def update
    authorize! :edit , @publication_type
    @publication_type.publication_attributes = attributes_list_param
    respond_to do |format|
      if @publication_type.update(publication_type_params)
        format.html { redirect_to @publication_type, notice: 'Publication type was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication_type }
      else
        @attrs = PublicationAttribute.prepare_select_array
        @selected = params[:publication_type][:publication_attributes][:id]
        format.html { render :edit }
        format.json { render json: @publication_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publication_types/1
  # DELETE /publication_types/1.json
  def destroy
    authorize! :destroy , @publication_type
    @publication_type.destroy
    respond_to do |format|
      format.html { redirect_to publication_types_url, notice: 'Publication type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication_type
      @publication_type = PublicationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_type_params
       params.require(:publication_type).permit(:name)
    end

    def attributes_list_param
      PublicationAttribute.where(id: params[:publication_type][:publication_attributes][:id])
    end
end
