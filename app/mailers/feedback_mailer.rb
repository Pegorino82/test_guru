class FeedbackMailer < ApplicationMailer
  def send_feedback
    @feedback = params[:feedback]
    mail(to: ENV['SMTP_USER_NAME'],
         subject: "Feedback from #{@feedback.user.email}")
  end
end
