module Admin::GistsHelper

  def hash(html_url)
    html_url.split('/').last
  end
end
