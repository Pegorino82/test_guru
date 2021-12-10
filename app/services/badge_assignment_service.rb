# frozen_string_literal: true

class BadgeAssignmentService
  RULES_MAP = {
    all_by_category: BadgeAssignmentSpecifications::AllCategorySpecification,
    all_by_level: BadgeAssignmentSpecifications::AllLevelSpecification,
    on_first_try: BadgeAssignmentSpecifications::FirstTrySpecification
  }.freeze

  def initialize(result)
    @result = result
  end

  def gain_badges
    Badge.all.select do |badge|
      @result.user.badges.push(badge) if RULES_MAP[badge.rule.to_sym].new(badge: badge, result: @result).win?
    end
  end
end
