class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result, gist]

  def show; end

  def result
    @percent = @test_passage.percent_correct_answers
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    current_user.save_gist(@test_passage.current_question, result) if result.errors.nil?
    redirect_to @test_passage, flash_options(result)
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def flash_options(result)
    if result.errors.nil?
      { notice: "#{t('.success')} #{view_context.link_to('Gist', result.html_url, target: "_blank")}".html_safe}
    else
      { alert: t('.failure') }
    end
  end

end
