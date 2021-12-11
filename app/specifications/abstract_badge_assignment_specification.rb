# frozen_string_literal: true

class AbstractBadgeAssignmentSpecification
  def initialize(badge:, result:)
    @badge = badge
    @result = result
  end

  def win?
    raise "Method #{__method__} undefined for #{self.class}"
  end

  private

  def level_by_name(name)
    TestsHelper::LEVELS.key(name.to_sym)
  end
end
