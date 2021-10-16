# frozen_string_literal: true

class User < ApplicationRecord
  has_many :author, class_name: "Test", foreign_key: "author_id"
  has_many :tests_users
  has_many :tests, through: :tests_users

  def tests_by_level(level)
    self.tests.where(level: level).order(title: :DESC).pluck(:title)
  end
end
