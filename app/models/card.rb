class Card < ActiveRecord::Base
  validates_presence_of :question, :answer
  validates_uniqueness_of :question

  belongs_to :deck
end
