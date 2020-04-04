class CatagoryCourse < ApplicationRecord
  belongs_to :course
  belongs_to :catagory
end
