module ApplicationHelper
  def active_class?(path)
    'active' if request.path == path
  end
end
