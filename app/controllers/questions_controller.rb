# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def index
    respond_to do |format|
      format.text { render plain: 'All tests' }
      format.html do
        render inline: '<div>Test "<%= @test.title %>" questions:</div>
                                    <% @test.questions.each do |question| %>
                                      <div><%= "#{question.id}: #{question.body}" %></div>
                                    <% end %>'
      end
    end
  end

  def show
    respond_to do |format|
      format.text { render plain: @question.body }
      format.html { render inline: '<div><%= @question.body %></div>' }
    end
  end

  def new; end

  def create
    @test.questions.create!(question_params)

    redirect_to test_questions_url(@test.id)
  end

  def destroy
    @question.destroy!

    redirect_to test_questions_url(@question.test_id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_from_question_not_found
    render plain: 'Not found'
  end
end
