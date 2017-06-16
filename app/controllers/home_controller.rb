class HomeController < ApplicationController
  def index
    @cohorts = current_user.cohorts.all
    @cohort_announcements = Announcement.where(cohort_id: @cohorts.pluck(:id))
    @code_challenge = CodeChallenge.all
    @announcements = @cohort_announcements.where(meetup: false)
    @meetups = @cohort_announcements.where(meetup: true)
  end
end
