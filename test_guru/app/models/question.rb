class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_count_answer

  def validate_count_answer
    errors.add(:answers) unless answers.size.in?(1..4)
  end
end
