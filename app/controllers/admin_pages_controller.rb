class AdminPagesController < ApplicationController
  before_filter :authenticate_admin!

  def dashboard
  end
end
