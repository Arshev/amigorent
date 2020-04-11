module ApplicationHelper
  def active_class?(path)
    'active' if request.path == path
  end
  def bg_active(count)
    'bg1' if count.even?
  end
end
