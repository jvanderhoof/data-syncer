class SourceMappingsController < ApplicationController
  before_action :set_source_mapping, only: [:show, :edit, :update, :destroy, :mapping]

  # GET /source_mappings
  # GET /source_mappings.json
  def index
    @source_mappings = SourceMapping.all
  end

  # GET /source_mappings/1
  # GET /source_mappings/1.json
  def show
  end

  # GET /source_mappings/new
  def new
    @source_mapping = SourceMapping.new
  end

  # GET /source_mappings/1/edit
  def edit
  end

  # POST /source_mappings
  # POST /source_mappings.json
  def create
    @source_mapping = SourceMapping.new(source_mapping_params)

    respond_to do |format|
      if @source_mapping.save
        format.html { redirect_to mapping_source_mapping_path(@source_mapping), notice: 'Source mapping was successfully created.' }
        format.json { render :show, status: :created, location: @source_mapping }
      else
        format.html { render :new }
        format.json { render json: @source_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_mappings/1
  # PATCH/PUT /source_mappings/1.json
  def update
    respond_to do |format|
      if @source_mapping.update(source_mapping_params)
        format.html { redirect_to @source_mapping, notice: 'Source mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @source_mapping }
      else
        format.html { render :edit }
        format.json { render json: @source_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_mappings/1
  # DELETE /source_mappings/1.json
  def destroy
    @source_mapping.destroy
    respond_to do |format|
      format.html { redirect_to source_mappings_url, notice: 'Source mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mapping
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_mapping
      @source_mapping = SourceMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_mapping_params
      params.require(:source_mapping).permit(:source_id, :destination_id)
    end
end
