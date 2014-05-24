class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :views
  has_many :subscriptions

  def already_viewed?(question)
    # add condition  || self == question.user
    true if self.views.where(question: question).present?
  end

  def subscribed_to?(tag)
    Subscription.where(user: self, tag: tag).first
  end
end
