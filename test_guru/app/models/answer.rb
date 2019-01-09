class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :rigth_answers, -> { where(correct: true) }
end
