# frozen_string_literal: true

class User < ApplicationRecord
  def tests_by_level(level)
    Result.joins('JOIN tests ON results.test_id = tests.id')
          .select('tests.title as title')
          .where(user_id: id, tests: { level: level })
          .order(title: :DESC)
          .pluck(:title)
  end
end
