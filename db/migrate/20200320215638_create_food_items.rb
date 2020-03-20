class CreateFoodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :food_items do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.float :weight
      t.date :expiration_date

      t.timestamps
    end
  end
end
