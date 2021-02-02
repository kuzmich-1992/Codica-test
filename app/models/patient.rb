# frozen_string_literal: true

class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  has_one :user, as: :multiple_role, dependent: :destroy
  accepts_nested_attributes_for :user
end
