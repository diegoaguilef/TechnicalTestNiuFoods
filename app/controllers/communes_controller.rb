class CommunesController < ApplicationController
  before_action :set_commune, only: %i[ show edit update destroy ]

  # GET /communes or /communes.json
  def index
    @communes = Commune.all
  end

  # GET /communes/1 or /communes/1.json
  def show
  end

  # GET /communes/new
  def new
    @commune = Commune.new
  end

  # GET /communes/1/edit
  def edit
  end

  # POST /communes or /communes.json
  def create
    @commune = Commune.new(commune_params)

    respond_to do |format|
      if @commune.save
        format.html { redirect_to @commune, notice: "Commune was successfully created." }
        format.json { render :show, status: :created, location: @commune }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commune.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communes/1 or /communes/1.json
  def update
    respond_to do |format|
      if @commune.update(commune_params)
        format.html { redirect_to @commune, notice: "Commune was successfully updated." }
        format.json { render :show, status: :ok, location: @commune }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commune.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communes/1 or /communes/1.json
  def destroy
    @commune.destroy

    respond_to do |format|
      format.html { redirect_to communes_path, status: :see_other, notice: "Commune was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commune
      @commune = Commune.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commune_params
      params.require(:commune).permit(:name, :city_id)
    end
end
