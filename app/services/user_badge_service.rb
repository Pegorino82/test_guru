# frozen_string_literal: true

class UserBadgeService
  def initialize(result)
    @result = result
    @user = @result.user
    @test = @result.test
    @rules = Badge.rules.values
    @passed_tests = Result.passed
  end

  def gain_badges
    Badge.all.select do |badge|

      if badge_for_on_first_try
        return @user.badges.push(badge)
      elsif badge_for_category(badge.rule_value)
        return @user.badges.push(badge)
      elsif badge_for_level(badge.rule_value)
        return @user.badges.push(badge)
      end
    end
  end

  private

  def badge_for_category(category_id)
    tests = Test.where(category_id: category_id)
    passed_tests = @passed_tests.where(test: tests)
    tests.count.zero? ? false : passed_tests.count % tests.count == 0
  end

  def badge_for_level(level)
    tests = Test.where(level: level_by_name(level))
    passed_tests = @passed_tests.where(test: tests)
    tests.count.zero? ? false : passed_tests.count % tests.count == 0
  end

  def badge_for_on_first_try
    @result.passed? && Result.where(test: @test).count == 1
  end

  def level_by_name(name)
    TestsHelper::LEVELS.key(name.to_sym)
  end
end
