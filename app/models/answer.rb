# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_amount, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_amount
    errors.add(:answers_amount, 'Answers limit reached.') unless question.answers.count < 4
  end
end
