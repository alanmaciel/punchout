class WelcomeController < ApplicationController
  before_action :require_signin, except: :index 

  def index
  end

  def admin_menu
  end
  

end
