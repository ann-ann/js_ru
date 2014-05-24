class Tag < ActiveRecord::Base
  has_and_belongs_to_many :questions
  has_many :subscriptions

  validates :name, uniqueness: true

  def subscibe_unsubscribe(user)
    subscription = user.subscribed_to?(self)
    case subscription
      when nil then Subscription.create(user: user, tag: self)
      else subscription.destroy
    end
  end
end
