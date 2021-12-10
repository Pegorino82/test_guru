# frozen_string_literal: true

module BadgeAssignmentSpecifications
  class AllLevelSpecification < AbstractBadgeAssignmentSpecification
    def win?
      return false if @badge.rule != 'all_by_level'
      return false unless level_by_name(@badge.rule_value).include?(@result.test.level)

      tests = Test.where(level: level_by_name(@badge.rule_value))
      passed_tests = Result.passed.where(test: tests).count
      tests.count.zero? || passed_tests.zero? ? false : (passed_tests % tests.count).zero?
    end
  end
end
