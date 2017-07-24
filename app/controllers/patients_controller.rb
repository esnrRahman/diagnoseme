class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @encounters = Encounter.where(patient_id: @patient.id).all
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.first_name and @patient.first_name =~ /\d/
        @patient.errors.add(:first_name, "cannot have numbers in it")
        format.html { render :new }
        format.json { render json: patient.errors, status: :bad_request }

      elsif @patient.middle_name and @patient.middle_name =~ /\d/
        @patient.errors.add(:middle_name, "cannot have numbers in it")
        format.html { render :new }
        format.json { render json: @patient.errors, status: :bad_request }

      elsif @patient.last_name and @patient.last_name =~ /\d/
        @patient.errors.add(:last_name, "cannot have numbers in it")
        format.html { render :new }
        format.json { render json: @patient.errors, status: :bad_request }

      else
        if @patient.save
          format.html { redirect_to patients_url, notice: 'Patient was successfully created.' }
          format.json { render :show, status: :created, location: @patient }
        else
          format.html { render :new }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.first_name and @patient.first_name =~ /\d/
        @patient.errors.add(:first_name, "cannot have numbers in it")
        format.html { render :new }
        format.json { render json: patient.errors, status: :bad_request }

      elsif @patient.middle_name and @patient.middle_name =~ /\d/
        @patient.errors.add(:middle_name, "cannot have numbers in it")
        format.html { render :new }
        format.json { render json: @patient.errors, status: :bad_request }

      elsif @patient.last_name and @patient.last_name =~ /\d/
        @patient.errors.add(:last_name, "cannot have numbers in it")
        format.html { render :new }
        format.json { render json: @patient.errors, status: :bad_request }

      else
        if @patient.update(patient_params)
          format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
          format.json { render :show, status: :ok, location: @patient }
        else
          format.html { render :edit }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:first_name, :middle_name, :last_name, :weight, :height, :mrn)
    end
end
