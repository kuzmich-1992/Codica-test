# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :authenticate_user!, :authenticate_patient, except: %i[new create update show]

  before_action :new_registration, only: %i[new create]

  before_action :set_patient, only: %i[show edit update destroy]

  def index
    @patients = Patient.all
    @doctors = if params[:doctor] && params[:doctor][:specialization]
                 Doctor.search(params[:doctor][:specialization])
               else
                 Doctor.all
               end
  end

  def new
    @patient = Patient.new
    @patient.build_user
  end

  def create
    @patient = Patient.new(patients_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to root_path, notice: 'Patients profile was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patients.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def patients_params
    params.require(:patient).permit(:name, user_attributes: %i[id email name password password_confirmation])
  end

  def authenticate_patient
    redirect_to(new_user_session_path) unless current_user.multiple_role_type == 'Patient'
  end

  def new_registration
    redirect_to('patients#index') if user_signed_in?
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
