# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :patient, foreign_key: true
      t.references :doctor, foreign_key: true
      t.string :visit_time
      t.text :description
      t.boolean :status_open, default: true
      t.timestamps
    end
  end
end
