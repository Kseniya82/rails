module Admin::GistsHelper
  def gist_url(gist_id)
    "https://gist.github.com/#{gist_id}"
  end
end
