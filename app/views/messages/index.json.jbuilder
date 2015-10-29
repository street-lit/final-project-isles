json.array!(@messages) do |message|
  json.extract! message, :id, :body, :user_id, :chatroom_id
  json.url message_url(message, format: :json)
end
