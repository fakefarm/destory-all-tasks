class Task < ActiveRecord::Base

  include SimplePosition
  default_scope order(:position)

  attr_accessible :completed, :item, :tags, :feature, :position

  has_many :comments

end
