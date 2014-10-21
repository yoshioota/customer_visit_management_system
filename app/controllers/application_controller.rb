class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SimpleBreadcrumbs

  # 自動でトランザクションがかかるように
  around_action :wrap_transaction, only: [:create, :update, :delete]

  private

  def wrap_transaction
    ActiveRecord::Base.transaction do
      yield
    end
  end

end
