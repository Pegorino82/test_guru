# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }
  scope :by_category, -> (title) { joins(:category)
                                     .where(categories: { title: title })
                                     .order(title: :desc)
                                     .pluck(:title) }
end
