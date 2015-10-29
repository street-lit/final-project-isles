json.array!(@observations) do |observation|
  json.extract! observation, :id, :body, :photo_id, :album_id, :user_id
  json.url observation_url(observation, format: :json)
end
