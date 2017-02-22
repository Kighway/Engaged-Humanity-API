#
# USERS
#

jenny = User.create({first_name: "Jenny", last_name: "Kats", username: "jennyk", email: "jenny@fake.com", profile_url: "../images/dummy.jpeg", password: "1234"})
kyle = User.create({first_name: "Kyle", last_name: "Tulod", username: "kylet", email: "kyle@fake.com", profile_url: "../images/dummy.jpeg", password: "1234"})
andrew = User.create({first_name: "Andrew", last_name: "Nease", username: "andrewn", email: "andrew@fake.com", profile_url: "../images/dummy.jpeg", password: "1234"})
kyle_friend = User.create({first_name: "Kylo", last_name: "Peterson", username: "kylop", profile_url: "../images/dummy.jpeg", email: "kylefriend@fake.com", password: "1234"})
jerk = User.create({first_name: "Donald", last_name: "Unger", username: "donaldu", email: "jerk@fake.com", profile_url: "../images/dummy.jpeg", password: "1234"})

#
# FRIENDSHIPS
#

# jenny follows kyle and andrew
jenny.followings << kyle
jenny.followings << andrew

# kyle follows jenny
kyle.followings << jenny

# andrew follows kyle
andrew.followings << kyle

# kyle's friend follows kyle
kyle_friend.followings << kyle

#
# INTERESTS
#
dogs = Interest.create(title: "dogs")
cats = Interest.create(title: "cats")

#
# ARTICLES
#
article1 = Article.create({title: "Cat are fantastic.", description: "An article about Cats.", url: "http://www.url1.com", source: "Cat Fancy Mag", author: "Caterina Snowbottom", image_url: "http://www.url1.com/cat.jpg", date: "date is a currently a string"})

article2 = Article.create({title: "Dogs are wonderful.", description: "An article about Dogs.", url: "http://www.url2.com", source: "Dog Power Mag", author: "Rex Fido", image_url: "http://www.url2.com/dog.jpg", date: "date is a currently a string"})

article3 = Article.create({title: "Puppies pee a lot.", description: "A second article about Dogs.", url: "http://www.url3.com", source: "Dog Power Mag", author: "Rex Fido", image_url: "http://www.url3.com/dog2.jpg", date: "date is a currently a string"})

article4 = Article.create({title: "It's raining cats and dogs.", description: "An article about cats and dogs.", url: "http://www.url4.com", source: "Dogs and Cats Together Mag", author: "Max Headspace", image_url: "http://www.url4.com/cat_and_dog.jpg", date: "date is a currently a string"})

article5 = Article.create({title: "Puppies pee.  So what?", description: "An article about puppies still peeing.", url: "http://www.url5.com", source: "Puppy Power Mag", author: "Max Headspace", image_url: "http://www.url5.com/peeing_puppy.jpg", date: "date is still a string"})

#
# ARTICLE INTERESTS
#
article1.interests << Interest.find_by(title: "cats")
article2.interests << Interest.find_by(title: "dogs")
article3.interests << Interest.find_by(title: "dogs")
article4.interests << [Interest.find_by(title: "dogs"), Interest.find_by(title: "cats")]
article5.interests << Interest.find_by(title: "dogs")

#
# LIKES
#

# Jenny likes cat article
Like.create(user_id: 1, article_id: 1)

# Kyle likes two dog articles
Like.create(user_id: 2, article_id: 5)
Like.create(user_id: 2, article_id: 2)
Like.create(user_id: 2, article_id: 3)

# Andrew likes cat article 1, and dog article 2, but not puppies
Like.create(user_id: 3, article_id: 1)
Like.create(user_id: 3, article_id: 2)

# Donald doesn't like anything



#
# USER INTERESTS
#
jenny.interests << cats
kyle.interests << dogs
andrew.interests << cats
andrew.interests << dogs



# NOTES
# rake db:reset -- drop, create, migrate, seed

# find all of a user's likes
# User.first.likes

# find all of a user's liked articles
# User.first.articles

# find all of a user's friends
# User.first.friends



# find all of a user's friend's likes
# User.first.friends.first.likes

# find all articles about a topic
# Interest.first.articles

# find all interests associated with an article
# Article.first.interests

# find all of a user's interest's articles
# User.first.interests.first.articles

# for fun:
# User.first.articles.first.interests.first.articles.first.users
