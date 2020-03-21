class AddNotesToStorageTypesAndCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :storage_types, :notes, :text
    add_column :categories, :notes, :text
  end
end
