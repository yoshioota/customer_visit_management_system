module ApplicationHelper

  def time_str(time)
    return '' if time.nil?
    l time
  end

  def logo_path
    if /\/admin/ === request.path
      '/admin'
    else
      '/'
    end
  end

  def navbar_color_class
    if /\/admin/ === request.path
      'navbar-inverse'
    else
      'navbar-default'
    end
  end
end
