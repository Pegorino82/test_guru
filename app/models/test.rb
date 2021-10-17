# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.by_category(title)
    joins(:category)
      .where(categories: { title: title })
      .order(title: :DESC)
  end
end
