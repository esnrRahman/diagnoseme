class EncountersController < ApplicationController
  before_action :set_patient
  before_action :set_encounter, only: [:show, :edit, :update, :destroy]

  # GET /encounters
  # GET /encounters.json
  def index
    @encounters = Encounter.all
  end

  # GET /encounters/1
  # GET /encounters/1.json
  def show
  end

  # GET /encounters/new
  def new
    @encounter = Encounter.new
  end

  # GET /encounters/1/edit
  def edit
  end

  # POST /encounters
  # POST /encounters.json
  def create
    @encounter = Encounter.new(encounter_params)
    respond_to do |format|
      validated = true

      if not @encounter.discharged_at.nil? and @encounter.discharged_at < @encounter.admitted_at
        validated = false
        @encounter.errors.add(:discharged_at, "cannot be lower than Admitted at")
      end

      if validated and @encounter.save
        format.html { redirect_to patient_url(:id => @patient.id), notice: 'Encounter was successfully created.' }
        format.json { render :show, status: :created, location: @encounter }
      else
        format.html { render :new }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end

    end
  end

  # PATCH/PUT /encounters/1
  # PATCH/PUT /encounters/1.json
  def update
    respond_to do |format|
      validated = true
      discharged_at_date = nil

      admitted_at_date = DateTime.new(encounter_params[:"admitted_at(1i)"].to_i,
                                      encounter_params[:"admitted_at(2i)"].to_i,
                                      encounter_params[:"admitted_at(3i)"].to_i,
                                      encounter_params[:"admitted_at(4i)"].to_i,
                                      encounter_params[:"admitted_at(5i)"].to_i)

      if not encounter_params[:"discharged_at(1i)"].empty? and
          not encounter_params[:"discharged_at(2i)"].empty? and
          not encounter_params[:"discharged_at(3i)"].empty? and
          not encounter_params[:"discharged_at(4i)"].empty? and
          not encounter_params[:"discharged_at(5i)"].empty?
        discharged_at_date = DateTime.new(encounter_params[:"discharged_at(1i)"].to_i,
                                        encounter_params[:"discharged_at(2i)"].to_i,
                                        encounter_params[:"discharged_at(3i)"].to_i,
                                        encounter_params[:"discharged_at(4i)"].to_i,
                                        encounter_params[:"discharged_at(5i)"].to_i)
      end

      if discharged_at_date and discharged_at_date < admitted_at_date
        validated = false
        @encounter.errors.add(:discharged_at, "cannot be lower than Admitted at")
      end

      if validated and @encounter.update(encounter_params)
        format.html { redirect_to patient_url(:id => @patient.id), notice: 'Encounter was successfully updated.' }
        format.json { render :show, status: :ok, location: @encounter }
      else
        format.html { render :edit }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end

    end
  end

  # DELETE /encounters/1
  # DELETE /encounters/1.json
  def destroy
    @encounter.destroy
    respond_to do |format|
      format.html { redirect_to patient_url(:id => @patient.id), notice: 'Encounter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encounter_params
      params.require(:encounter).permit(:visit_no, :admitted_at, :discharged_at, :location, :room, :bed).merge(:patient_id => params[:patient_id])
    end
end
