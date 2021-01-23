class Patient < ApplicationRecord
  has_one :user, as: :multiple_role, dependent: :destroy
  accepts_nested_attributes_for :user
end
