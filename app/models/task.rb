class Task < ActiveRecord::Base
  before_create :add_due_date

  include SimplePosition
  default_scope order(:position)

  attr_accessible :completed, :item, :tags, :feature, :position, :due_date

  has_many :comments

private

  def add_due_date
    self.due_date = Time.now.in_time_zone("Mountain Time (US & Canada)")
  end
end
