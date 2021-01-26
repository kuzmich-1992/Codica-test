class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def create
    @patient = Patient.find_by(params[:multiple_role_id])
    @doctor = Doctor.find_by(params[:multiple_role_id])
    @appointment = @patient.appointments.build(appointments_params)
    if @appointment.save!
      respond_to do |format|
        format.json { head :no_content }
        format.html { redirect_to request.referrer }
      end
    end
  end

  def appointments_params
    params.require(:appointment).permit(:doctor_id, :patient_id)
  end
end
