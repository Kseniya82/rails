class ResultObject
  attr_reader :html_url

  def initialize(gist_url)
    @html_url = gist_url
  end

  def success?
    @html_url.present?
  end
end
