# frozen_string_literal: true

class Appointment < ApplicationRecord
  validates :visit_time, presence: true
  belongs_to :patient
  belongs_to :doctor
end
