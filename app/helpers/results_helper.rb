# frozen_string_literal: true

module ResultsHelper
  def html_class
    @result.passed? ? 'success' : 'failed'
  end

  def message
    @result.passed? ? t('results.result.success') : t('results.result.failed')
  end

  def current_question
    t('results.show.current_question', num: @result.current_question_num, count: @result.test.questions.count)
  end
end
