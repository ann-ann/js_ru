class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :views
  has_and_belongs_to_many :tags

  validates_presence_of :title, :text, :tags

  default_scope { order('created_at DESC') }
end
