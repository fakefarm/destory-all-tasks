# First rake tasks!
# Thanks to Ryan Bates - RailsCast #66

# Rake tasks go into lib/tasks directory
# End the file with '.rake'

task :greet do
  puts "Hello World!"
end
# To run, type: '(be) rake greet'


# Need to chain w/ dependencies?
# For example, Run greet before ask
task :ask => :greet do
  puts "How are you?"
end


# Namespaces can shorten names and group them.
# To call name spaced task, type:rake todo:today
namespace :todo do

  # Add the description using 'desc "and the description here"'
  # so that when you run rake -T it's helpful to what it is.
  desc "Picks a random task"

  # Rake tasks don't automatically load rails environment.
  # To get them to do so, add '=> :environment' dependency
  task :random => :environment do
    task = Task.find(:all).sample(1).first
    puts "Task: #{task.item}"
  end

  desc "Lists tasks for today"
  task :today => :environment do
    tasks = Task.where('due_date < ?', Time.now)
    tasks.each do |task|
      puts "##{task.id} #{task.item}"
    end
  end

# Make a task to run other tasks.
# Doesn't need a block.
# Run it with type: rake todo:all
  task :all => [:random, :today]
end


# Refactor with methods
# Separate queries from tasks
namespace :comments do
  desc "Picks a random comment from the pile"
  task :random => :environment do
    puts "comment: #{pick(Comment).entry}"
  end

  def pick(model_class)
    model_class.find(:all).sample(1).first
  end
end