# == Schema Information
#
# Table name: itineraries
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  activities_count :integer
#  cover_image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Itinerary < ApplicationRecord
  validates(:poster, { :presence => true })

  # Association accessor methods to define:
  
  ## Direct associations

  # Itinerary#owner: returns a row from the users table associated to this itinerary by the owner_id column
  belongs_to(:poster, class_name: "User", foreign_key: "owner_id")

  # Itinerary#activities: returns rows from the activity table associated to this itinerary by the itinerary_id column
  has_many(:activities, class_name: "Activity", foreign_key: "itinerary_id")

  # Itinerary#likes: returns rows from the likes table associated to this itinerary by the itinerary_id column
  has_many(:likes, class_name: "Like", foreign_key: "itinerary_id")

  ## Indirect associations

  # Itinerary#fans: returns rows from the users table associated to this Itinerary through its likes
  has_many(:fans, through: :likes, source: :fan)
end
