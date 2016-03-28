json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :owner, :is_public
  json.url project_url(project, format: :json)
end
