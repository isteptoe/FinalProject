class Catalog < ApplicationRecord
    has_many :plans
    has_many :course_catalogs
    has_many :courses, through: :course_catalogs
    has_many :requirements
end
