# frozen_string_literal: true

class Badge < ApplicationRecord
  enum rule: {
    all_by_category: 0,
    all_by_level: 1,
    on_first_try: 2
  }

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :path, presence: true
end
