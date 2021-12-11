# frozen_string_literal: true

module BadgeAssignmentSpecifications
  class AllLevelSpecification < AbstractBadgeAssignmentSpecification
    def win?
      return false if @badge.rule != 'all_by_level'
      return false unless level_by_name(@badge.rule_value).include?(@result.test.level)

      tests = Test.where(level: level_by_name(@badge.rule_value))
      passed_tests = Result.passed.where(user: @result.user, test: tests)
      tests.empty? || passed_tests.empty? ? false : (passed_tests.count % tests.count).zero?
    end
  end
end
