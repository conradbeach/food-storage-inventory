class AddAdultsProvidingForToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :adults_providing_for, :float
  end
end
