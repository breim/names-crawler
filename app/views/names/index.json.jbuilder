json.array!(@names) do |name|
  json.extract! name, :id, :name, :shot, :description, :male, :female
  json.url name_url(name, format: :json)
end
