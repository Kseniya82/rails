module TestPassagesHelper
  def result_color(percent)
    if percent >= 85
      :green
    else
      :red
    end
  end

  def result_header(percent, test_passage)
    if percent >= 85
      "Test #{test_passage.test.title} successfully complete"
    else
      "Test #{test_passage.test.title} is not passed"
    end
  end
end
