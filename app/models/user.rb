# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, uniqueness: true, presence: true
  belongs_to :multiple_role, polymorphic: true, dependent: :destroy
end
