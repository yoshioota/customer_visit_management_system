class AuthorizedController < ApplicationController
  before_action :authenticate_employee!

  before_action do
    add_breadcrumb_home
  end
end
