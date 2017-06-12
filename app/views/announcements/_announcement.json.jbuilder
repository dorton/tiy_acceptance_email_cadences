json.extract! announcement, :id, :date, :title, :location, :cohort_id, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
