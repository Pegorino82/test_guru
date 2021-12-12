# frozen_string_literal: true

class Result < ApplicationRecord
  SUCCESS_SCORE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_save :set_result

  scope :passed, -> { where('result >= ?', SUCCESS_SCORE) }

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    return if time_out?

    self.score += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save!
  end

  def success_percentage
    (score * 100.0 / test.questions.count).round(1)
  end

  def passed?
    success_percentage >= SUCCESS_SCORE if completed?
  end

  def current_question_num
    test.questions.order(:id).where('id <= ?', current_question.id).size
  end

  def time_out?
    return false unless timer_set?

    Time.current - created_at > test.timer.minutes
  end

  def left_time
    return 0 unless timer_set?

    left_t = (created_at + test.timer.minutes) - Time.current
    left_t.positive? ? left_t.to_i : 0
  end

  def timer_set?
    !test.timer.nil?
  end

  private

  def set_result
    self.result = success_percentage
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
