class Comment < ActiveRecord::Base
  attr_accessible :entry, :tags, :task_id, :user_id
  belongs_to :task
  belongs_to :user
end
