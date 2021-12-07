# frozen_string_literal: true

class Badge < ApplicationRecord
  enum rule: %i[all_by_category all_by_level on_first_try]

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :path, presence: true
end
