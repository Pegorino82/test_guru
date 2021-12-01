# frozen_string_literal: true

class Badge < ApplicationRecord
  belongs_to :badge_rule

  validates :title, presence: true
  validates :path, presence: true
end
