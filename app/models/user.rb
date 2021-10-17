# frozen_string_literal: true

class User < ApplicationRecord
  has_many :authorship, class_name: "Test", foreign_key: "author_id"
  has_many :results
  has_many :tests, through: :results

  def tests_by_level(level)
    self.tests.where(level: level).order(title: :DESC).pluck(:title)
  end
end
