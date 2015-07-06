json.array!(@names) do |name|
  json.extract! name,:name , :description, :male, :female
end