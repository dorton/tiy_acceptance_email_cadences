require 'json'
require 'net/http'

namespace :daily do
  desc "TODO"
  task meetups: :environment do
    url = "https://api.meetup.com/self/calendar?photo-host=public&page=20&sig_id=#{ENV['sig_id']}&sig=f5b46eee2b6c9e62b089c010b746cc46e6ac6456"
    response = Net::HTTP.get_response(URI.parse(url))
    data = response.body

    raw = JSON.parse(data)

    raw.each do |r|
      event_name = r["name"]
      event_description = r["description"]
      venue_name = r["venue"]["name"] if r["venue"].present?
      date = Time.at(r["time"]/1000).to_datetime
      group = r["group"]["name"] if r["group"].present?
      event_url = r["link"]
      cohort = Cohort.last
      announcement = cohort.announcements.find_or_initialize_by(title: event_name)
      announcement.location = venue_name
      announcement.date = date
      announcement.description = event_description
      announcement.meetup = true
      announcement.host_group = group
      announcement.event_url = event_url
      announcement.save!
    end
  end

end
