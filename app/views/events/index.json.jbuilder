json.array!(@events) do |event|
  json.extract! event, :id, :occasion, :description, :dateof, :milestone, :friend_id
  json.url event_url(event, format: :json)
end
