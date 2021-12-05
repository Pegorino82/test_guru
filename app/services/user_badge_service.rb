# frozen_string_literal: true

class UserBadgeService
  def initialize(result)
    @result = result
    @user = @result.user
    @test = @result.test
  end

  def gain_badges
    return [] unless @result.passed?
    badges = []

    BadgeRule.all.select do |badge_rule|
      add_badge = true

      # все тесты с фильтром по категории - уровню
      all_test_ids = Test.where(test_query_options(badge_rule)).distinct.pluck(:id)

      # пройденные пользователем тесты с фильтром по категории - уровню
      user_passed_tests_ids = user_passed_tests(all_test_ids)

      # по количеству пройденных тестов
      if badge_rule.amount != nil || badge_rule.all == true
        amount = badge_rule.amount unless badge_rule.amount.nil?
        amount = all_test_ids.count if badge_rule.all
        add_badge = false if user_passed_tests_ids.count < amount
      end

      # по количеству попыток
      unless badge_rule.attempts.nil?
        add_badge = false if user_passed_tests_ids.count(@test.id) > badge_rule.attempts
      end

      if add_badge
        badge = Badge.find_by_badge_rule_id(badge_rule.id)
        @user.badges.push(badge) unless badge.nil?
        badges << "#{badge.title}" unless badge.nil?
      end
    end

    badges
  end

  private

  def level_by_name(name)
    TestsHelper::LEVELS.key(name.to_sym)
  end

  def test_query_options(badge_rule)
    category_id = @test.category.id
    level = @test.level
    test_query_options = {}

    unless badge_rule.category_id.nil?
      test_query_options[:category_id] = category_id if badge_rule.category_id == category_id
    end

    unless badge_rule.level.nil?
      if !level_by_name(badge_rule.level).nil? && level_by_name(badge_rule.level).include?(level)
        test_query_options[:level] = level_by_name(badge_rule.level)
      end
    end
    test_query_options
  end

  def user_passed_tests(tests_ids)
    result_query_options = {}
    result_query_options[:test_id] = tests_ids unless tests_ids.empty?

    @user.results.passed
         .where(result_query_options)
         .select(:id, :test_id)
         .distinct.pluck(:test_id)
  end
end


