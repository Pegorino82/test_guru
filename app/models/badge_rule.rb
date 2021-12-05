# frozen_string_literal: true


class BadgeRule < ApplicationRecord
  LEVELS = TestsHelper::LEVELS.values.map { |x| x.to_s }.freeze

  belongs_to :category, optional: true
  has_many :badges, dependent: :destroy

  validates :title, presence: true
  validates_with Validators::BadgeRuleValidator
end

