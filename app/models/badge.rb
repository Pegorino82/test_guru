# frozen_string_literal: true

class Badge < ApplicationRecord
  belongs_to :badge_rule
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :path, presence: true
end
