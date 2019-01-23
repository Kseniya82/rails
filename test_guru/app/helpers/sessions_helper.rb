module SessionsHelper
  def flash_message(key)
    content_tag :p, flash[key], id: key, class: "flash #{key}" if !flash[key].blank?
  end
end
