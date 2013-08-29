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
end