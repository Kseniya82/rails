module QuestionsHelper
  def question_header(question)
    "Edit #{question.test.title} question"if question.persisted?
    "Create New #{question.test.title} question" if question.new_record?
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
