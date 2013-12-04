module AdminPolicy
  class << self
    def allowed?(user)
      true if user.role == 'admin'
    end
  end
end
