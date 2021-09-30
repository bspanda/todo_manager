class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = is_completed ? "[X]" : "[]"
    "#{id}.  #{due_date.to_s(:short)}  #{todo_text} #{is_completed}"
  end
end
