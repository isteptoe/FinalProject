class Course < ApplicationRecord
    has_many :plan_courses
 	has_many :plans, through: :plan_courses
    has_many :course_catalogs
    has_many :catalogs, through: :course_catalogs
    has_many :catagory_courses
    has_many :catagorys, through: :catagory_courses
end
