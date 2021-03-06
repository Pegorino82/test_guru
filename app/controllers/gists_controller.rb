# frozen_string_literal: true

class GistsController < ApplicationController
  def create
    @result = Result.find_by(result_params)
    gist_question = GistQuestionService.new.call(@result.current_question)

    if gist_question.success?
      Gist.create!(url: gist_question.html_url,
                   question: @result.current_question,
                   author: current_user)
      flash[:notice] = t('results.gist.success_html', link: gist_question.html_url)
    else
      flash[:alert] = t('results.gist.failure')
    end

    redirect_to @result
  end

  private

  def result_params
    params.require(:result).permit(:id)
  end
end
