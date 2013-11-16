module CreateProfileObserver
  def self.call(user)
    profile = Profile.create(name: 'destroyer')
    user.profile_id = profile.id
    user.save
  end
end
