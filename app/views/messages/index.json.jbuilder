json.array!(@messages) do |message|
  json.extract! message, :id, :body, :friend_id, :conversation_id, :user_id
  json.url message_url(message, format: :json)
end
