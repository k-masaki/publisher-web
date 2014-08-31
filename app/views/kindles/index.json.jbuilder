json.array!(@kindles) do |kindle|
  json.extract! kindle, :id, :user_id, :name, :email
  json.url kindle_url(kindle, format: :json)
end
