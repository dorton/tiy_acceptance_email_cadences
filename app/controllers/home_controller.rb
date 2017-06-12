class HomeController < ApplicationController
  def index
    @cohorts = current_user.cohorts.all
    @announcements = Announcement.where(cohort_id: @cohorts.pluck(:id))
    @code_challenge = CodeChallenge.all
  end
end
