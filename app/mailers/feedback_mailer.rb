class FeedbackMailer < ApplicationMailer
  def send_feedback
    @feedback = params[:feedback]
    mail(to: ENV['SMTP_USER_NAME'], from: @feedback.user.email, subject: 'Test email')
  end
end
