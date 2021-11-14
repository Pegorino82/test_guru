# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.persisted?
      # "Edit new #{question.test.title} question"
      t('admin.questions.edit.header', title: question.test.title)
    else
      # "Create new #{question.test.title} question"
      t('admin.questions.new.header', title: question.test.title)
    end
  end
end
