class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answers?(answer_ids)
    save!
  end

  def percent_correct_answers
    self.correct_questions.to_f / test.questions.count * 100
  end

  def current_question_number
    test.questions.ids.sort.index(current_question.id) + 1
  end

  def successful?
    percent_correct_answers >= 85
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def correct_answers?(answer_ids)
    return false if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.rigth_answers
  end

  def next_question
    if self.new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

end
