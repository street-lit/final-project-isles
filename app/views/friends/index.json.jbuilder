json.array!(@friends) do |friend|
  json.extract! friend, :id, :friend_requester, :friend_accepter
  json.url friend_url(friend, format: :json)
end
