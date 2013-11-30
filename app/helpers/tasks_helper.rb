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
      link_to 'Destroy', task, method: :delete
    end
  end
end
