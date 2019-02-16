class FeedbacksController < ApplicationController

  def new; end

  def create
    FeedbackMailer.sent_feedback(feedback_params).deliver_now
  end

  private

    def feedback_params
      params.permit(:email, :message)
    end
end
