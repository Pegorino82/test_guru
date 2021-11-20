class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    begin
      @http_client.create_gist(params.to_json)
    rescue => e
      nil
    end
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['GITHUB_TEST_GURU_ACCESS_TOKEN'])
  end
end
