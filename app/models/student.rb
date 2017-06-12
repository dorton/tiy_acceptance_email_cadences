class Student < ApplicationRecord
  belongs_to :cohort

  def name
    "#{first_name} #{last_name}"
  end
end
