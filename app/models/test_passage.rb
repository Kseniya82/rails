class TestPassage < ApplicationRecord
  MIN_CORRECT_PERCENT = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  scope :success, -> { where('percent >= ?', MIN_CORRECT_PERCENT) }

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answers?(answer_ids)
    self.percent = percent_correct_answers
    save!
  end

  def percent_correct_answers
    correct_questions.to_f / test.questions.count * 100
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def successful?
    percent >= MIN_CORRECT_PERCENT
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def correct_answers?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.rigth_answers
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
