# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action :find_result, only: %i[show update result]

  def show; end

  def result; end

  def update
    @result.accept!(params[:answer_ids])
    if @result.completed?
      badges = UserBadgeService.new(@result).gain_badges
      win_badges_flash(badges.map {|b| b.title})
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  private

  def find_result
    @result = Result.find(params[:id])
  end

  def win_badges_flash(badges)
    flash[:notice] = "#{t('results.result.badge_win')}: #{badges.join(',')}!" unless badges.count.zero?
  end
end
