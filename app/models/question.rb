class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :views
  has_and_belongs_to_many :tags

  validates_presence_of :title, :text, :tags

  paginates_per 10

  scope :with_counted_answers, -> {
    joins('LEFT OUTER JOIN answers ON answers.question_id = questions.id')
    .group('questions.id')
  }

  scope :without_answers, -> {
    with_counted_answers
    .having('count(answers.id) = 0')
  }

  scope :hot, -> {
    with_counted_answers
    .having('count(answers.id) > 0')
    .where("answers.created_at > ?", 1.month.ago)
    # TODO add subscriptions counting
  }

  def self.search(search)
   if search
     Question.try(search.to_sym)
    else
      Question.order('created_at desc')
    end
  end
end
