class Catagory < ApplicationRecord
  belongs_to :requirement
  has_many :catagory_courses
  has_many :courses, through: :catagory_courses
end
