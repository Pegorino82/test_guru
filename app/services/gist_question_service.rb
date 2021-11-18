class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
    @result = create_gist
  end

  def success?
    html_url.present?
  end

  def html_url
    @result.html_url
  end

  def create_gist
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title),
      files: {
        "#{@test.title}_#{@question.body}.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    @question.answers.map {|answer| answer.body}.join("\n")
  end
end
