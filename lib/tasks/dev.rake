require "date"

desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  if Rails.env.development?
    Activity.destroy_all
    Itinerary.destroy_all
    User.destroy_all
  end
  
  user = User.new
  user.username = "Jasmine"
  user.itineraries_count = 0
  user.likes_count = 0
  user.email = "jasmine@example.com"
  user.password = "jasmine"
  user.save

  user2 = User.new
  user2.username = "Madelyn"
  user2.itineraries_count = 0
  user2.likes_count = 0
  user.email = "madelyn@example.com"
  user.password = "madelyn"
  user2.save

  users = User.all
  p "Added #{User.count} Users"

  =begin

  itinerary = Itinerary.new
  itinerary.name = "Lisbon"
  itinerary.caption = "My Lisbon itinerary"
  itinerary.cover_image = "https://i0.wp.com/jordangassner.com/wp-content/uploads/2023/06/Portugal-Lisbon-Fronteira-Gardens-3.jpg?resize=1080%2C1620&ssl=1"
  itinerary.likes_count = 0
  itinerary.bookmarks_count = 0
  itinerary.activities_count = 0
  itinerary.owner_id = users.at(0)
  users.at(0).itineraries_count += 1
  itinerary.save

  itinerary2 = Itinerary.new
  itinerary2.name = "Cancun"
  itinerary2.caption = "My Cancun itinerary"
  itinerary2.cover_image = "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/c3/79/cc/xcaret.jpg?w=1200&h=-1&s=1"
  itinerary2.likes_count = 0
  itinerary2.activities_count = 0
  itinerary2.owner_id = users.at(1)
  users.at(1).itineraries_count += 1
  itinerary2.save

  p "Added #{Itinerary.count} Itineraries"
  itineraries = Itinerary.all

  activity = Activity.new
  activity.name = "Taberna Sal Grosso"
  activity.description = "Lunch!"
  activity.cover_image = "https://images.culinarybackstreets.com/wp-content/uploads/cb_lisbon_tabernasalgrossoupdate_jcc_final_interior.jpg?lossy=1&resize=800%2C533&ssl=1"
  activity.bookmark_count = 0
  activity.location = 
  activity.rating = 5
  activity.itinerary_id = itineraries.at(0)
  activity.traveller_id = itineraries.at(0).owner_id
  new_date = Date.new(2024,3,18)
  activity.date = new_date
  new_time = Time.parse("14:00")
  activity.time = new_time
  itineraries.at(0).activities_count += 1
  acitivity.save

  activity2 = Activity.new
  activity2.name = "Mandala Beach Club"
  activity2.description = "Two Friends Party"
  activity2.cover_image = "https://i0.wp.com/discotech.me/wp-content/uploads/2019/05/mandalabanner.jpg?resize=1500%2C630&ssl=1"
  activity2.bookmark_count = 0
  activity2.location = "https://g.co/kgs/vbdfhMn"
  activity2.rating = 3
  activity2.itinerary_id = itineraries.at(1)
  activity2.traveller_id = itineraries.at(1).owner_id
  new_date2 = Date.new(2023,3,11)
  activity2.date = new_date
  new_time2 = Time.parse("12:00")
  activity2.time = new_time
  itineraries.at(1).activities_count += 1
  activity2.save

  p "Added #{Activity.count} Activities"
  all_activities = Activity.all

  

end
