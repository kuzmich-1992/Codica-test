class PatientsController < ApplicationController
  
  before_action :authenticate_user!, :authenticate_doctor, except: [:new, :create, :update, :show]


  def index
    @patients = Patient.all
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
     params.require(:patient).permit(:name, user_attributes: [ :id, :email, :name, :password, :password_confirmation ])
   end

end