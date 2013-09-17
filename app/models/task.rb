class Task < ActiveRecord::Base

  include SimplePosition
  default_scope order(:position).reverse_order

  attr_accessible :completed, :item, :tags, :feature, :position

  has_many :comments

end
