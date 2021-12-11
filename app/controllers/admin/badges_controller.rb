# frozen_string_literal: true

module Admin
  class BadgesController < Admin::BaseController
    before_action :find_badge, only: %i[edit update destroy]
    before_action :dataset, only: %i[new create]

    def index
      @badges = Badge.all
    end

    def new
      @badge = Badge.new
    end

    def edit; end

    def create
      @badge = Badge.new(badge_params)
      if @badge.save
        redirect_to admin_badges_path
      else
        render :new
      end
    end

    def update
      if @badge.update(badge_params)
        redirect_to admin_badges_path
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy!

      redirect_to admin_badges_path
    end

    private

    def find_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:title, :path, :rule, :rule_value)
    end

    def dataset
      @rules = {
        'all_by_category' => Category.all.pluck(:id, :title),
        'all_by_level' => TestsHelper::LEVELS.values.map {|val| [val, val]},
        'on_first_try' => []
      }
    end
  end
end
