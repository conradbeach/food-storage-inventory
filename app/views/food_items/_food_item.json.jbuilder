# frozen_string_literal: true

json.extract!(
  food_item,
  :id,
  :category_id,
  :name,
  :weight,
  :expiration_date,
  :created_at,
  :updated_at,
)
json.url food_item_url(food_item, format: :json)
