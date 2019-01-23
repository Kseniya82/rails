module TestPassagesHelper
  def result_header(test_passage)
    if test_passage.successful?
      "Test #{test_passage.test.title} successfully complete"
    else
      "Test #{test_passage.test.title} is not passed"
    end
  end
end
