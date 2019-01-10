class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_answer, on: :create

  scope :rigth_answers, -> { where(correct: true) }

  def validate_count_answer
    errors.add(:base) unless question.answers.length < 4
  end
end
