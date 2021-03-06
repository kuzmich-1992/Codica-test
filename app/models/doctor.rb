# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_one :user, as: :multiple_role, dependent: :destroy
  accepts_nested_attributes_for :user

  def self.search(search)
    where('specialization LIKE ?', "%#{search}")
  end
end
