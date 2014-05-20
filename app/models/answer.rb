class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  before_create :set_default_rating

  def set_default_rating
   self.rating = 0
  end
end