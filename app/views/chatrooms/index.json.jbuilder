json.array!(@chatrooms) do |chatroom|
  json.extract! chatroom, :id, :name, :topic
  json.url chatroom_url(chatroom, format: :json)
end
