class Task < ActiveRecord::Base
  attr_accessible :completed, :item, :feature
end
