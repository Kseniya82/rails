class TestPassage < ApplicationRecord
  # не работает корретно или вообще не работает непонятно
  attr_accessor :question_number

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  around_update :next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answers?(answer_ids)
      # При тестировании один раз при трассировке было корректное кол-во правильных ответов
      # повторить не смогла, все время их 0
      self.correct_questions += 1
    end
    save!
  end

  def percent_correct_answers (test_passage)
    test_passage.correct_questions / test_passage.test.questions.count * 100
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
    self.question_number = 1
  end

  def correct_answers?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.rigth_answers
  end

  def next_question
    self.current_question = self.test.questions.order(:id).where('id > ?', current_question.id).first
    self.question_number += 1
  end

end
