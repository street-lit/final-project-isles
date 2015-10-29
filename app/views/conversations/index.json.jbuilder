json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :name, :topic, :user_id, :chatroom_id
  json.url conversation_url(conversation, format: :json)
end
