# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview
  def weekly_mailer
    StudentMailer.weekly_mailer(Cohort.first, Student.first)
  end
end
