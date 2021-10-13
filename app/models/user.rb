# frozen_string_literal: true

class User < ApplicationRecord
  def tests_by_level(level)
    Result.where(user_id: id, tests: { level: level })
          .joins('JOIN tests ON results.test_id = tests.id')
          .select('tests.title, tests.level, tests.category_id').all
  end
end
