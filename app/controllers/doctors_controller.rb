class DoctorsController < ApplicationController
  
  before_action :authenticate_user!, :authenticate_doctor, except: [:new, :create, :update, :show]

  before_action :new_registration, only: [:new, :create]

  before_action :set_doctor, only: [:show, :edit, :update, :destroy]   


  def index
    @doctors = Doctor.all
  end


  def new
    @doctor = Doctor.new
    @doctor.build_user
  end

  
  def create
    @doctor = Doctor.new(doctors_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to root_path, notice: 'Doctors profile was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end
    
private

  def doctors_params
    params.require(:doctor).permit(:name, :specialization, user_attributes: [ :id, :email, :name, :password, :password_confirmation ])
  end
   
  def authenticate_doctor     
    redirect_to(new_user_session_path) unless current_user.multiple_role_type == "Doctor"  
  end
  
  def new_registration
    redirect_to("doctors#index") if user_signed_in?
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end