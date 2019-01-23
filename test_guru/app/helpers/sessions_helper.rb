module SessionsHelper
  def flash_message(key)
    unless flash[key].nil?
      content_tag :p, flash[key], id: key, class: "flash #{key}"
    end
  end
end
