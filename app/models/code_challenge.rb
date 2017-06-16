class CodeChallenge < ApplicationRecord
  def self.weekly(date)
    weeks_apart = date.cweek - Date.today.cweek
    self.find_by(weeks_out: weeks_apart.to_s)

  end
end
