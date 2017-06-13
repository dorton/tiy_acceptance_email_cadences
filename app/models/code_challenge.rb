class CodeChallenge < ApplicationRecord
  def self.weekly(date)
    weeks_apart = date.cweek - Date.today.cweek
    self.find(weeks_apart)
  end
end
