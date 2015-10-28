json.array!(@chatrooms) do |chatroom|
  json.extract! chatroom, :id, :name, :user_id
  json.url chatroom_url(chatroom, format: :json)
end
