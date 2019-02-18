class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbackMailer.sent_feedback(feedback_params).deliver_now
      flash[:notice] = t('.success')
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :message)
  end
end
