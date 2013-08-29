class Task < ActiveRecord::Base
  attr_accessible :completed, :item, :tags, :feature
  has_many :comments
end
