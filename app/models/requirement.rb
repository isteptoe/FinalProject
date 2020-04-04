class Requirement < ApplicationRecord
  belongs_to :major
  belongs_to :catalog
  has_many :catagorys
end
