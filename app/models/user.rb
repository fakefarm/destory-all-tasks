class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :task_counter_id

  validates_uniqueness_of :email

  before_create { generate_token(:auth_token) }

  has_many :tasks
  has_many :comments, through: :tasks
  belongs_to :task_counter

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
