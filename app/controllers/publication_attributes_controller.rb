class PublicationAttributesController < ApplicationController
  before_action :set_attribute, only: [:show, :edit, :update, :destroy]

  # GET /attributes
  # GET /attributes.json
  def index
    @attributes = PublicationAttribute.all.order("name ASC")
  end

  # GET /attributes/1
  # GET /attributes/1.json
  def show
  end

  # GET /attributes/new
  def new
    @attribute = PublicationAttribute.new
  end

  # GET /attributes/1/edit
  def edit
    authorize! :edit , @attribute
  end

  # POST /attributes
  # POST /attributes.json
  def create
    authorize! :create , PublicationAttribute
    @attribute = PublicationAttribute.new(attribute_params)
      respond_to do |format|
      if @attribute.save
        format.html { redirect_to publication_attributes_path, notice: 'Attribute was successfully created.' }
        format.json { render :show, status: :created, location: @attribute }
      else
        format.html { render :new }
        format.json { render json: @attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attributes/1
  # PATCH/PUT /attributes/1.json
  def update
    authorize! :edit , @attribute
    respond_to do |format|
      if @attribute.update(attribute_params)
        format.html { redirect_to @attribute, notice: 'Attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @attribute }
      else
        format.html { render :edit }
        format.json { render json: @attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attributes/1
  # DELETE /attributes/1.json
  def destroy
    authorize! :destroy , @attribute
    @attribute.destroy
    respond_to do |format|
      format.html { redirect_to publication_attributes_url, notice: 'Attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute
      @attribute = PublicationAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attribute_params
      params.require(:publication_attribute).permit(:name, :type)
    end
end
