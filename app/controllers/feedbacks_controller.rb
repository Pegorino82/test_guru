# frozen_string_literal: true

class FeedbacksController < ApplicationController
  before_action :find_user, only: %i[new create]

  def new
    @feedback = @user.feedbacks.build
  end

  def create
    @feedback = @user.feedbacks.build(feedback_params)
    if @feedback.save
      FeedbackMailer.with(feedback: @feedback).send_feedback.deliver_now
      redirect_to tests_path, notice: t('.success', user: @user.name.capitalize)
    else
      render :new
    end
  end

  private

  def find_user
    @user = current_user || User.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:message)
  end
end
