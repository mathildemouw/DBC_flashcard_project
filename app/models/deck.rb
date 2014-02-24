class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cards

  has_many :scores
  has_many :users, through: :scores
end
