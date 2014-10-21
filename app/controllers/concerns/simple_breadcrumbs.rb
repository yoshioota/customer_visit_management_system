module SimpleBreadcrumbs
  extend ActiveSupport::Concern

  included do
    before_filter do
      @breadcrumbs = []
    end
  end

  def add_breadcrumb(label, link = nil)
    @breadcrumbs << [label, link]
  end

  def add_breadcrumb_home
    add_breadcrumb('担当者HOME', home_path)
  end

  def add_breadcrumb_admin_home
    add_breadcrumb('管理者HOME', admin_path)
  end

end
