module ResultsHelper
  def html_class
    @result.passed? ? 'color:green' : 'color:red'
  end

  def message
    @result.passed? ? 'You passed test!' : 'You failed test'
  end

  def current_question
    "Question #{@result.current_question_num} of #{@result.test.questions.count}"
  end
end
