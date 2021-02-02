# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :specialization

      t.timestamps
    end
  end
end
