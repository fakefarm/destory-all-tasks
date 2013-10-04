class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :task_counter_id

  validates_uniqueness_of :email
  has_many :tasks
  has_many :comments, through: :tasks
  belongs_to :task_counter
end
