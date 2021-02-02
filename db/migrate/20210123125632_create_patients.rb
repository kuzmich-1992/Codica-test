# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients, &:timestamps
  end
end
