module DeleteAllTaggedTasksService
  class << self
    def call(tag)
      Task.where(tags: tag).destroy_all
    end
  end
end
