# frozen_string_literal: true

require_relative './validators/badge_rule_validator'

class BadgeRule < ApplicationRecord
  LEVELS = TestsHelper::LEVELS.values.map { |x| x.to_s }.freeze

  belongs_to :category, optional: true
  has_many :badges, dependent: :destroy

  validates_with BadgeRuleValidator
end

