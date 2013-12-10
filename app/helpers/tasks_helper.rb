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
      link_to "#{pluralize(task.comments.count, 'note')}", task_path(task), class: 'link-button-destroy'
    else
      link_to 'Destroy', task, method: :delete, remote: true, class: 'link-button-destroy'
    end
  end

  def flex_punt_path(task)
    if task.due_date <= Time.now
      if params[:action] == 'index'
        link_to 'Punt', task_path(task, task: { due_date: punt_time }), remote: true, class: 'link-button-punt', method: :put
      else
        require 'pry'; binding.pry
        link_to 'Punt', task_path(task, due_date: punt_time), class: 'link-button-punt', method: :put
      end
    else
      link_to 'Return', task_path(task, due_date: Time.now ), class: 'link-button-punt', method: :put
    end
  end
end
