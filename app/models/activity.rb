# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  cover_image          :string
#  bookmarks_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  traveller_id       :integer
#

class Activity < ApplicationRecord
  validates(:poster, { :presence => true })
  validates(:plan, { :presence => true })

  # Association accessor methods to define:
  
  ## Direct associations

  # Activity#traveller: returns a row from the users table associated to this activity by the owner_id column
  belongs_to(:traveller, class_name: "User", foreign_key: "owner_id")

  # Activity#corresponding_itinerary: returns a row from the itinerary table associated to this activity by the itinerary_id column
  belongs_to(:corresponding_itinerary, class_name: "Itinerary", foreign_key: "itinerary_id")

  # Activity#bookmarks: returns rows from the bookmarks table associated to this activity by the activity_id column
  has_many(:bookmarks, class_name: "Like", foreign_key: "activity_id")

  ## Indirect associations

  # Activity#keen: returns rows from the users table associated to this activity through its bookmarks
  has_many(:keens, through: :bookmarks, source: :keen)
end
