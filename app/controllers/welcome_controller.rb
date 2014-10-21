class WelcomeController < ApplicationController

  def index

    redirect_to('/home') if current_employee

  end
end
