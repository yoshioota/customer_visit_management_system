class Admin::AdminAuthorizedController < ApplicationController

  before_action :authenticate_employee!

  before_action do
    raise unless current_employee.admin?
  end

  before_action do
    add_breadcrumb_admin_home
  end

end
