class FeedbackMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def sent_feedback(feedback_params)
    @from = feedback_params[:email]
    @message = feedback_params[:message]

    mail from: @from
  end
end
