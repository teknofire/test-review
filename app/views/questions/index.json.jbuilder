json.array!(@questions) do |question|
  json.extract! question, :id, :section_id, :text
  json.url question_url(question, format: :json)
end
