# frozen_string_literal: true

module Admin
  class BadgeRulesController < Admin::BaseController
    before_action :find_badge_rule, only: %i[show desrtoy]

    def show; end

    def new
      @badge_rule = BadgeRule.new
    end

    def edit; end

    def create
      @badge_rule = BadgeRule.new(badge_rule_params)
      if @badge_rule.save
        redirect_to admin_badges_path
      else
        render :new
      end
    end

    def destroy
      @badge_rule.destroy!

      redirect_to admin_badges_path
    end

    private

    def find_badge_rule
      @badge_rule = BadgeRule.find(params[:id])
    end

    def badge_rule_params
      params.require(:badge_rule).permit(:title,
                                         :category_id,
                                         :amount,
                                         :all,
                                         :attempts)
    end

  end
end
