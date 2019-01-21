class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_answer, on: :create

  scope :rigth_answers, -> { where(correct: true) }

  # Все равно не раблотает (
  def validate_count_answer
    errors.add(:base) if question.answers.count >= 4
  end
end
