json.array!(@requests) do |request|
  json.extract! request, :id, :user_id, :requested_friend_id, :are_friends, :did_confirm
  json.url request_url(request, format: :json)
end
