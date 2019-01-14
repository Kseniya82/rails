class QuestionsController < ApplicationController
  before_action :find_test, only: :index

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: "<% @test.questions.each do |question| %><p><%= question.body %></p><% end %>"
  end

  def show
    render inline: "<p><%= Question.find(params[:id].to_i).body %></p>"
  end

  def destroy
    question = Question.find(params[:id].to_i)
    question.desroy
    render plain: "Вопрос <%= params[:id].to_i %> удален"
  end

  def new
  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  private

  def find_test
    @test = Test.find(params[:test_id].to_i)
  end

  def question_params
    params[:test_id] = params[:test_id].to_i
    params.permit(:test_id, :body)
  end
  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
