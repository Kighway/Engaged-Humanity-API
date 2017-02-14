# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jenny = User.create({first_name: "Jenny", last_name: "Kats", username: "jennyk", password: "1234"})
kyle = User.create({first_name: "Kyle", last_name: "Tulod", username: "kylet", password: "1234"})
andrew = User.create({first_name: "Andrew", last_name: "Nease", username: "andrewn", password: "1234"})

article1 = Article.create({title: "Article1", description: "description1", link: "link1", source: "source1", author: "author1", image_url: "image_url1", date: "date is a string1"})

article2 = Article.create({title: "Article2", description: "description2", link: "link2", source: "source2", author: "author2", image_url: "image_url2", date: "date is a string2"})

Like.create(user_id: 1, article_id: 1)
Like.create(user_id: 1, article_id: 2)
Like.create(user_id: 2, article_id: 1)

happiness = Interest.create(title: "Happiness")
sadness = Interest.create(title: "Sadness")

jenny.interests << happiness




#
# create_table "friendships", force: :cascade do |t|
#   t.integer  "user_id"
#   t.integer  "friend_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "interests", force: :cascade do |t|
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "likes", force: :cascade do |t|
#   t.integer  "user_id"
#   t.integer  "article_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
