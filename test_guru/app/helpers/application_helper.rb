module ApplicationHelper
  def current_year
    Time.current.year
  end

  def flash_class(level)
    flash_classes = { notice: 'info', success: 'success', error: 'danger', alert: 'danger' }
    flash_classes[level.to_sym] || 'primary'
  end
end
