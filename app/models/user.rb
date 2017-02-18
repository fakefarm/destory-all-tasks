class User < ActiveRecord::Base
  has_secure_password
  before_save :sanitize_user

  validates_uniqueness_of :email, :case_sensitive => false

  before_create { generate_token(:auth_token) }

  has_many :tasks
  has_many :comments, through: :tasks
  belongs_to :task_counter
  belongs_to :profile

private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def sanitize_user
    self.email = self.email.downcase.strip
  end
end
