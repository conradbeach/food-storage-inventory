# frozen_string_literal: true

class CreateStorageTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :storage_types do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
