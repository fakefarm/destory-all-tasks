class Profile < ActiveRecord::Base
  attr_accessible :name, :time_zone, :punt_default
  has_many :users
  accepts_nested_attributes_for :users
end
