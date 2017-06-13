class Student < ApplicationRecord
  belongs_to :cohort

  scope :open_todos, -> {
      where(down_payment: false)
      .or(where(enrollment_agreement: false))
      .or(where(transcript: false))
      .or(where(financially_cleared: false))
    }

  scope :no_todos, -> {
      where(down_payment: true)
      .where(enrollment_agreement: true)
      .where(transcript: true)
      .where(financially_cleared: true)
    }

  require 'csv'

  def self.import(file, cohort)
    CSV.foreach(file.path, headers: true) do |row|
      student = cohort.students.find_or_initialize_by(email: row['Email'])
      student.first_name = row['First Name']
      student.last_name = row['Last Name']
      student.enrollment_agreement = row['Student Has Signed Student Agreement?'] == 'Yes'
      student.down_payment = row['Financial Status'] == 'Deposit Received'
      student.financially_cleared = row['Financial Status'] == 'Financially Cleared'
      student.yes_we_code = row['Financial Status'] == 'Full Tuition Grant'
      student.save!
    end
  end



  def name
    "#{first_name} #{last_name}"
  end

  def self.todos(student, date)
    todos = []
    unless student.down_payment?
      todos << "You can pay your downpayment here: <a href='https://app.moonclerk.com/pay/fbd0e7p7iuo'>https://app.moonclerk.com/pay/fbd0e7p7iuo</a>.".html_safe
    end
    unless student.enrollment_agreement?
      todos << "Make sure that you have signed your enrollment agreement. You can find the link in your acceptance email."
    end
    unless student.transcript?
      todos << "You can send Christie your transcripts at <a href='mailto:christie@theironyard.com?subject=Transcripts'>christie@theironyard.com</a>.".html_safe
    end
    unless student.financially_cleared?
      todos << "Please ensure that your tuition arrangments are made by #{(date - 5.days).strftime('%m/%d/%Y')}. You can contact <a href='mailto:finance@theironyard.com'>finance@theironyard.com</a> for help.".html_safe
    end
    todos
  end
end
