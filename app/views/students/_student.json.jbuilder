json.extract! student, :id, :first_name, :last_name, :email, :down_payment, :financially_cleared, :enrollment_agreement, :transcript, :yes_we_code, :cohort_id, :created_at, :updated_at
json.url student_url(student, format: :json)
