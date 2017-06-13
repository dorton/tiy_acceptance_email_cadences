class Cohort < ApplicationRecord
  has_many :users, through: :user_cohorts
  has_many :user_cohorts, dependent: :destroy
  has_many :students
  has_many :announcements, dependent: :destroy
end
