class WelcomeController < ApplicationController
  before_action :require_signin, only: :admin_menu 

  def index
  end

  def admin_menu
  end

  def employee_menu
  end
  

end
