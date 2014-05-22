class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :views
  has_and_belongs_to_many :tags

  validates_presence_of :title, :text, :tags

  paginates_per 10

  scope :with_counted_answers, -> {
    select('questions.*, COUNT(answers.id) as answers_count')
    .joins('LEFT OUTER JOIN answers ON answers.question_id = questions.id')
    .group('questions.id')
  }

  scope :without_answers, -> (apply) {
    having('count(answers.id) = 0') if apply
  }
end
