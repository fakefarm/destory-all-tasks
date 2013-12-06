module TasksHelper
  MESSAGES = [
    "You. Are. A. Machine",
    "Agent Smith stands no chance against you",
    "Now go on a hike!",
    "Cheers!",
    "Dang Dude!"
  ]
  def message
    if TaskCounter.count == 0;
      "Let's destroy some tasks."
    else
      MESSAGES[rand(0..MESSAGES.count)]
    end
  end

  def flex_destroy_path(task)
    if task.comments.count > 0
      link_to "#{pluralize(task.comments.count, 'note')}", task_path(task)
    else
      link_to 'Destroy', task, method: :delete, remote: true
    end
  end

  def flex_punt_path(task)
    if task.due_date <= Time.now
      link_to 'punt', task_path(task:{ due_date: punt_time }), method: :put
    else
      render 'tasks/punt/punt_return', task: task
    end
  end
end
