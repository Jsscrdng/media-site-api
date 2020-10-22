# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Users
user = FactoryBot.create(:user, email: Faker::Internet.unique.email )

# Create Movies
movies = FactoryBot.create_list(:movie, 10)
p 'Movies created'
## Create Purchase Options for movies
movies.each do |movie|
  PurchaseOption::QUALITIES.keys.each do |quality|
    FactoryBot.create(:purchase_option, quality: quality, purchasable: movie)
  end
end
p 'Movies now have all qualities availables'

movie1 = FactoryBot.create(:movie, title: 'SD only movie', plot: 'SD only movie')
FactoryBot.create(:purchase_option, quality: 'sd', purchasable: movie1)

p "Movie with id #{movie1.id} created only in sd quality"

# Create Seasons
seasons = FactoryBot.create_list(:season, 10)
p 'Seasons created'
## Create Purchase Options for seasons
seasons.each do |season|
  PurchaseOption::QUALITIES.keys.each do |quality|
    FactoryBot.create(:purchase_option, quality: quality, purchasable: season)
  end
end
p 'Seasons now have all qualities availables'

season1 = FactoryBot.create(:season, title: 'HD only movie', plot: 'HD only season')
FactoryBot.create(:purchase_option, quality: 'hd', purchasable: season1)
p "Season with id #{season1.id} created only in hd quality"

FactoryBot.create_list(:episode, 10, season: season1)

p "episodes created for season with hd only quality (id: #{season1.id})"

#User purchases
Purchase.create!(purchase_option: movies.second.purchase_options.last, user: user)
Purchase.create!(purchase_option: movies.first.purchase_options.second, user: user)
Purchase.create!(purchase_option: seasons.first.purchase_options.second, user: user)
