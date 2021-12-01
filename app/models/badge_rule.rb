# frozen_string_literal: true

require_relative './validators/badge_rule_validator'

class BadgeRule < ApplicationRecord
  LEVELS = TestsHelper::LEVELS.values.map{|x| x.to_s}.push(nil).freeze

  has_one :badges, dependent: :destroy

  validates :level, inclusion: { in: LEVELS,
                                   message: "available [#{LEVELS.join(', ')}] only" }

  validates_with BadgeRuleValidator
end

