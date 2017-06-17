class HomeController < ApplicationController
  def index
    @cohorts = current_user.cohorts.all
    @cohort = @cohorts.last
    @cohort_announcements = Announcement.where(cohort_id: @cohorts.pluck(:id))
    @weekly_challenge = CodeChallenge.weekly(@cohort.start_date)
    @announcements = @cohort_announcements.where(meetup: false)
    @meetups = @cohort_announcements.where(meetup: true).where(date: Date.today.beginning_of_week..Date.today.end_of_week)
  end
end
