class GistQuestionService
  ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params.to_json)
  end

  private

  def gist_params
    {
      description: I18n.t('service.gist_question_service.description_gist', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  private

  def default_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

end
