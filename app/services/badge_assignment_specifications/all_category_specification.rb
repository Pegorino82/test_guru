# frozen_string_literal: true

module BadgeAssignmentSpecifications
  class AllCategorySpecification < AbstractBadgeAssignmentSpecification
    def win?
      return false if @badge.rule != 'all_by_category'
      return false unless @badge.rule_value.to_i == @result.test.category.id

      tests = Test.where(category_id: @badge.rule_value)
      passed_tests = Result.passed.where(test: tests).count
      tests.count.zero? || passed_tests.zero? ? false : (passed_tests % tests.count).zero?
    end
  end
end
