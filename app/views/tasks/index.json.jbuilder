json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :description, :priority, :due_date, :is_completed
  json.url task_url(task, format: :json)
end
