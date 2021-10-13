# frozen_string_literal: true

class User < ApplicationRecord
  def tests_by_level(level)
    Result.select('results.id, tests.title, tests.level, categories.title AS category')
          .joins('JOIN tests ON results.test_id = tests.id')
          .joins('JOIN categories ON tests.category_id = categories.id')
          .where(user_id: id, tests: { level: level })
          .all
  end
end
