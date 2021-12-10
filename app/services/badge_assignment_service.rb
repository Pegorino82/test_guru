# frozen_string_literal: true

class BadgeAssignmentService
  def initialize(result)
    @result = result
    @user = @result.user
    @test = @result.test
    @rules = Badge.rules.values
    @passed_tests = Result.passed
  end

  def gain_badges
    Badge.all.select do |badge|
      @user.badges.push(badge) if send(badge.rule.to_sym, badge)
    end
  end

  private

  def all_by_category(badge)
    return false if badge.rule != 'all_by_category'
    tests = Test.where(category_id: badge.rule_value)
    passed_tests = @passed_tests.where(test: tests)
    tests.count.zero? ? false : passed_tests.count % tests.count == 0
  end

  def all_by_level(badge)
    return false if badge.rule != 'all_by_level'
    tests = Test.where(level: level_by_name(badge.rule_value))
    passed_tests = @passed_tests.where(test: tests)
    tests.count.zero? ? false : passed_tests.count % tests.count == 0
  end

  def on_first_try(badge)
    return false if badge.rule != 'on_first_try'
    @result.passed? && Result.where(test: @test).count == 1
  end

  def level_by_name(name)
    TestsHelper::LEVELS.key(name.to_sym)
  end
end
