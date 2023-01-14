# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Event.create(
  [
    {
      location: 'Santa Clara',
      date: Time.now + (7 * 24 * 3600)
    },
    {
      location: 'Standford',
      date: Time.now + (3 * 7 * 24 * 3600)
    },
    {
      location: 'Cantor Art Center',
      date: Time.now + (2 * 7 * 24 * 3600)
    }
  ]
)
