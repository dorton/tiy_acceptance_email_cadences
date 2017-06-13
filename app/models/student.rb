class Student < ApplicationRecord
  belongs_to :cohort
  scope :open_todos, -> { where(down_payment: false) || where(enrollment_agreement: false) || where(transcript: false) || where(financially_cleared: false)   }
  scope :no_todos, -> { where(down_payment: true).where(enrollment_agreement: true).where(transcript: true).where(financially_cleared: true)   }

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
