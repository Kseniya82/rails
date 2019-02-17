class FeedbacksController < ApplicationController

  def new; end

  def create
    if params[:email].present? && params[:message].present?
      FeedbackMailer.sent_feedback(feedback_params).deliver_now
      flash[:notice] = t('.success')
      redirect_to root_path
    else
      flash[:alert] = t('.failed')
      redirect_to new_feedback_path
    end
  end

  private

  def feedback_params
    params.permit(:email, :message)
  end
end
