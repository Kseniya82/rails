class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      @test_passage.save_result
      BadgeService.new(@test_passage).call if @test_passage.successful?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question
    result = GistQuestionService.new(question).call
    if result.success?
      flash[:nonice] = "#{t('.success_html', link: result.html_url)}"
      current_user.gists.create!(question_id: question.id, url: result.html_url)
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
