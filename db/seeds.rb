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

Flat.destroy_all
User.destroy_all

@user1 = User.new(username: "Waldo", email: "charlie@gmail.com", password: "ouioui")
@user1.save
@user2 = User.new(username: "Iris", email: "iris@gmail.com", password: "ouioui")
@user2.save
@user3 = User.new(username: "Flo", email: "flo@gmail.com", password: "ouioui")
@user3.save
@user4 = User.new(username: "Manu", email: "manu@gmail.com", password: "ouioui")
@user4.save

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
=begin @flat = Flat.new(title: "Maison Paris",
                  price: 90,
                  guest: 7,
                  bedroom: 5,
                  description:"superbe maison au centre de Paris avec un accès au metro en moins de 2 minutes à pied",
                  address: "63 avenue des champs Elysées 75000 Paris",
                  city:"Paris",
                  user: users.sample,
                  photo: "https://resize.elle.fr/original/var/plain_site/storage/images/deco/reportages/visites-maisons/un-appartement-de-75m2-aux-allures-douces-et-retro/97678096-1-fre-FR/Un-appartement-de-75m2-aux-allures-douces-et-retro.jpg")
@flat.save
@flat = Flat.new(title: "Appartement Lacanau",
                  price: 60, guest: 3,
                  bedroom: 2,
                  description:"superbe appart à Lacanau Centre avec un accès à la plage en moins de 10 minutes à pied",
                  address: "63 allée du port 33320 Lacanau",
                  city:"Lacanau",
                  user: users.sample,
                  photo: "/home/irispradie/code/Irispradie/rails-watch-list/config/AIRBNB/app/assets/images/appart3.jpg")
@flat.save
=end

puts 'flats crées'
