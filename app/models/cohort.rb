class Cohort < ApplicationRecord
  belongs_to :user
  has_many :students
  has_many :announcements
end
