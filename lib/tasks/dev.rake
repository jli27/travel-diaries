desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  user = User.new
  user.username = "Jasmine"
  user.private = true
  user.itineraries_count = 0
  user.likes_count = 0
  user.email = "jasmine@example.com"
  user.password = "jasmine"
  user.save

  user2 = User.new
  user2.username = "Madelyn"
  user2.private = false
  user2.itineraries_count = 0
  user2.likes_count = 0
  user.email = "madelyn@example.com"
  user.password = "madelyn"
  user2.save

  users = User.all
  p "Added #{User.count} Users"

  itinerary = Itinerary.new
  itinerary.name = "Lisbon"
  itinerary.caption = "My Lisbon itinerary"
  itinerary.cover_image = "https://i0.wp.com/jordangassner.com/wp-content/uploads/2023/06/Portugal-Lisbon-Fronteira-Gardens-3.jpg?resize=1080%2C1620&ssl=1"
  itinerary.likes_count = 0
  itinerary.activities_count = 0
  itinerary.owner_id = users.at(0)
  itinerary.save

  itinerary2 = Itinerary.new
  itinerary2.name = "Cancun"
  itinerary2.caption = "My Cancun itinerary"
  itinerary2.cover_image = "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/c3/79/cc/xcaret.jpg?w=1200&h=-1&s=1"
  itinerary2.likes_count = 0
  itinerary2.activities_count = 0
  itinerary2.owner_id = users.at(0)
  itinerary2.save

  p "Added #{Photo.count} Photos"
  photos = Photo.all

end
