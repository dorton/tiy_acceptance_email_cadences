class StudentMailer < ApplicationMailer
  include ActionView::Helpers::DateHelper
  

  def weekly_mailer(cohort, student)
    @cohort = cohort
    @student = student
    @time_to_class = distance_of_time_in_words(Date.today, @cohort.start_date)
    @weekly_challenge = CodeChallenge.weekly(@cohort.start_date)
    @announcements = @cohort.announcements.where('date > ?', Date.today).where('date < ?', Date.today + 3.weeks)
    @todos = Student.todos(@student, @cohort.start_date)
    mail(to: @student.email, subject: "Your The Iron Yard Class Starts In Only #{@time_to_class.titleize}!")
  end
end
