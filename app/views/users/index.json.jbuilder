json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :username, :age, :city, :state, :twitter, :github, :linkedin, :phone_number, :birthday, :soundcloud, :facebook, :password_digest
  json.url user_url(user, format: :json)
end
