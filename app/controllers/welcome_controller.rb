class WelcomeController < ApplicationController
  respond_to :html

  def index
    redirect_to sections_path
  end
end
