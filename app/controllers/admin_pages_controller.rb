# frozen_string_literal: true

# Controller for Users with "Admin" role
class AdminPagesController < ApplicationController
  before_action :authenticate_user!

  # GET /admin_pages/dashboard
  def dashboard
    redirect_to root_path unless User.find(current_user["id"]).admin?

    @list_everyting = pagy Entry.everything
  end

  # POST /admin_pages/result
  def search; end

  # GET /admin_pages/result
  def result; end
end
