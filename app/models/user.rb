class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :views

  def already_viewed?(question)
    # add condition  || self == question.user
    true if self.views.where(question: question).present?
  end
end
