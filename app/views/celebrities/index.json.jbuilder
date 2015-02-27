json.array!(@celebrities) do |celebrity|
  json.extract! celebrity, :id, :name, :national, :domain
  json.url celebrity_url(celebrity, format: :json)
end
