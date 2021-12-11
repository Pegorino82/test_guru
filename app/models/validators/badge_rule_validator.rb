# frozen_string_literal: true

module Validators
  class BadgeRuleValidator < ActiveModel::Validator
    def validate(record)
      if record.all && !record.amount.nil?
        record.errors.add :base, 'Only one of "all" or "amount" available'
      end
    end
  end
end
