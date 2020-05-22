namespace :review_app do
  desc "Add fake data to review apps for easier reviewing"
  task :prime => :environment do
    # Users
    user = User.create!(email: "user@example.com", password: "password")

    # Storage Types
    storage_type = user.storage_types.create!(
      name: "Long-term Storage",
      notes: "We should remember..."
    )

    # Categories
    grains_category = storage_type.categories.create!(
      name: "Grains",
      unit_type: :pounds,
      units_per_year_per_adult: 250,
      notes: "Grains are the best. Wheat is the staff of life they say.",
    )
    legumes_category = storage_type.categories.create!(
      name: "Legumes",
      unit_type: :pounds,
      units_per_year_per_adult: 60,
      notes: "Hurrah for protein!",
    )
    sugars_category = storage_type.categories.create!(
      name: "Sugars",
      unit_type: :pounds,
      units_per_year_per_adult: 70,
      notes: "Thanks bees.",
    )
    multi_vitamins_category = storage_type.categories.create!(
      name: "Multi-vitamins",
      unit_type: :servings,
      units_per_year_per_adult: 365,
      notes: "One a day keeps the doctor away.",
    )

    # Food Items
    grains_category.food_items.create!([
      {
        name: "Red Wheat",
        expiration_date: 20.years.from_now,
        units: 50,
      },
      {
        name: "Red Wheat",
        expiration_date: 20.years.from_now,
        units: 50,
      },
      {
        name: "White Wheat",
        expiration_date: 3.years.from_now,
        units: 50,
      },
      {
        name: "Oats",
        expiration_date: 1.year.ago,
        units: 25,
      },
      {
        name: "Oats",
        expiration_date: 1.year.ago,
        units: 25,
      },
    ])

    legumes_category.food_items.create!([
      {
        name: "Black Beans",
        expiration_date: 30.years.from_now,
        units: 40,
      },
      {
        name: "Black Beans",
        expiration_date: 25.years.from_now,
        units: 40,
      },
    ])

    sugars_category.food_items.create!([
      {
        name: "Honey",
        expiration_date: 75.years.from_now,
        units: 5,
      },
      {
        name: "Honey",
        expiration_date: 75.years.from_now,
        units: 5,
      },
      {
        name: "Honey",
        expiration_date: 75.years.from_now,
        units: 2,
      },
    ])

    multi_vitamins_category.food_items.create!([
      {
        name: "Adult Multi-vitamin",
        expiration_date: 8.months.from_now,
        units: 120,
      },
    ])
  end
end
