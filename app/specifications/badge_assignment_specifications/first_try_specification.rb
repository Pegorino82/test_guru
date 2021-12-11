# frozen_string_literal: true

module BadgeAssignmentSpecifications
  class FirstTrySpecification < AbstractBadgeAssignmentSpecification
    def win?
      return false if @badge.rule != 'on_first_try'

      @result.passed? && Result.where(user: @result.user, test: @result.test).count == 1
    end
  end
end
