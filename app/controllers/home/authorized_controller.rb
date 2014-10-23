# 一般側、要ログインの機能はこのクラスを継承させる

class Home::AuthorizedController < ApplicationController
  before_action :authenticate_employee!

  before_action do
    add_breadcrumb_home
  end
end
