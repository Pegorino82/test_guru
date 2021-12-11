# frozen_string_literal: true

module BadgeAssignmentSpecifications
  class AllCategorySpecification < AbstractBadgeAssignmentSpecification
    def win?
      return false if @badge.rule != 'all_by_category'
      return false unless @badge.rule_value.to_i == @result.test.category.id

      tests = Test.where(category_id: @badge.rule_value)
      passed_tests = Result.passed.where(user: @result.user, test: tests)
      tests.empty? || passed_tests.empty? ? false : (passed_tests.count % tests.count).zero?
    end
  end
end
