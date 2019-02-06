module Admin::GistsHelper

  def question_body(question)
    truncate(question.body, length: 25)
  end

  def gist_id(url)
    url.rpartition("/").last
  end
end
