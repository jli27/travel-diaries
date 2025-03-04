# == Schema Information
#
# Table name: bookmark
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  keen_id     :integer
#  activity_id   :integer
#

class Like < ApplicationRecord
  validates(:keen, { :presence => true })
  validates(:activity, { :presence => true })
  validates(:activity_id, { 
    :uniqueness => { :scope => [:keen_id] }
  })

  # Association accessor methods to define:
  
  ## Direct associations

  # Bookmark#keen: returns a row from the users table associated to this like by the keen_id column
  belongs_to(:keen, class_name: "User", foreign_key = "keen_id")

  # Bookmark#activity: returns a row from the activity table associated to this bookmark by the activity_id column
  belongs_to(:activity, class_name: "Activity", foreign_key = "activity_id")
end
