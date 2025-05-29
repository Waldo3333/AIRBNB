# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'open-uri'



users = [@user1, @user2, @user3, @user4]

puts 'users crées'
@flat = Flat.new(title: "Villa Arcacon",
                 price: 80,
                 guest: 6,
                 bedroom: 4,
                 description:"superbe villa au bord du bassin d'arcachon avec un accès à la plage en moins de 5 minutes à pied",
                 address: "25 rue de la plage 33120 Arcachon",
                 city:"Arcachon",
                 user: users.sample)
file = URI.parse('https://resize.elle.fr/original/var/plain_site/storage/images/deco/reportages/visites-maisons/un-appartement-de-75m2-aux-allures-douces-et-retro/97678096-1-fre-FR/Un-appartement-de-75m2-aux-allures-douces-et-retro.jpg').open
@flat.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
@flat.save

puts 'flats crées'
