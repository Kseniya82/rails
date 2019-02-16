class FeedbackMailer < ApplicationMailer
  def sent_feedback(feedback_params)
    @admin = Admin.first
    @from = feedback_params[:email]
    @message = feedback_params[:message]

    mail(from: @from, to: @admin.email, subject: 'Feedback from ksu-test-guru')
  end
end
