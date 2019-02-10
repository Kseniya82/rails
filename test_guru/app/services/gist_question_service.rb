class GistQuestionService
  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  ResultObject = Struct.new(:html_url) do
    def success?
      html_url.present?
    end
  end
  
  def call
    @client.create_gist(gist_params.to_json)
    ResultObject.new(@client.last_response.data[:html_url])
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description_gist', title: @test.title),
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
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

end
