class Task < ActiveRecord::Base
  before_create :add_due_date
  scope :tag, ->(tag) { where("tags like ?", tag) }
  scope :current_user_id, ->(id){ where("user_id = ?", id) }
  scope :punted, ->{ where('due_date > ?', Time.now) }

  # TODO
  # style first, then add validations
  # validates :item, presence: true

  include SimplePosition
  default_scope order(:position)

  attr_accessible :completed, :item, :tags, :feature, :position, :due_date, :user_id

  has_many :comments
  belongs_to :user

private

  def add_due_date
    self.due_date = Time.now
  end
end
