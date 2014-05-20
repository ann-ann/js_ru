class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_and_belongs_to_many :tags

  validates_presence_of :title, :text

  before_create :set_default_data

  default_scope { order('created_at DESC') }

  def set_default_data
   self.rating = 0
   self.views_count = 0
  end

  def increase_views
    self.views_count +=1
    self.save
  end
end
