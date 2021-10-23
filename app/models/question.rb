# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true

  validate :validate_answers_amount, on: :create

  private

  def validate_answers_amount
    errors.add(:base, 'Question must has at least one answer.') if answers.count.zero?
  end
end
