# frozen_string_literal: true

class AddReferencesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :multiple_role_id, :integer
    add_column :users, :multiple_role_type, :string

    add_index :users, %i[multiple_role_id multiple_role_type]
  end
end
