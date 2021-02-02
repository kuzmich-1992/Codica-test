# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def update
    @patient = Patient.find_by(params[:multiple_role_id])
    @doctor = Doctor.find_by(params[:multiple_role_id])
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointments_params)
    @appointment.update(status_open: !@appointment.status_open?)
    @appointment.save!
    redirect_to doctors_path(@doctor)
  end

  def create
    @patient = Patient.find_by(params[:multiple_role_id])
    @doctor = Doctor.find_by(params[:multiple_role_id])
    @appointment = @patient.appointments.build(appointments_params)
    if @appointment.save
      respond_to do |format|
        format.json { head :no_content }
        format.html { redirect_to request.referrer }
      end
    else
      redirect_to patients_path
    end
  end

  def appointments_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :visit_time, :description, :status_open)
  end
end
