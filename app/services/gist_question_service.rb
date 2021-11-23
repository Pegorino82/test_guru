# frozen_string_literal: true

class GistQuestionService
  Result = Struct.new(:html_url) do
    def success?
      !html_url.nil?
    end
  end

  def initialize(client = default_client)
    @client = client
  end

  def call(question)
    @question = question
    @gist_result = @client.create_gist(gist_params)
    Result.new(html_url)
  end

  private

  def html_url
    @gist_result.html_url if @gist_result && @gist_result.html_url.present?
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @question.test.title),
      files: {
        "#{@question.test.title}_#{@question.body}.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    @question.answers.map(&:body).join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TEST_GURU_ACCESS_TOKEN'])
  end
end
