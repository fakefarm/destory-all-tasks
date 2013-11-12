module PuntAll
  class << self
    def call(tag)
      to_punt = Task.where(tags: tag)
      to_punt.each do |task|
        task.update_attributes(due_date: 3.days.from_now )
      end
    end
  end
end
