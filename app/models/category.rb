# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests, dependent: :destroy
  has_many :badge_rules, dependent: :destroy

  validates :title, presence: true
end
