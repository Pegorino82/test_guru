# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action :find_result, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @result.accept!(params[:answer_ids])
    if @result.completed?
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@result.current_question)

    if result.success?
      Gist.create!(url: result.html_url,
                   question: @result.current_question,
                   author: current_user)
    end

    redirect_to @result, flash_options(result)
  end

  private

  def find_result
    @result = Result.find(params[:id])
  end

  def flash_options(result)
    if result.success?
      { notice: t('results.gist.success', link: result.html_url ) }
    else
      { alert: t('results.gist.failure') }
    end
  end
end
