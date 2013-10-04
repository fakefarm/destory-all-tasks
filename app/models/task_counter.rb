class TaskCounter < ActiveRecord::Base
  attr_accessible :quantity
  has_many :users
end
