module SessionsHelper
  def flash_message(key)
    content_tag :p, flash[key], :id => key, :class => 'flash'
  end
end
