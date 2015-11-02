json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :friend_id_one, :friend_id_two, :title
  json.url conversation_url(conversation, format: :json)
end
