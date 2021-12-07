# frozen_string_literal: true

# Controller for Users with "Admin" role
class AdminPagesController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    redirect_to root_path unless User.find(current_user["id"]).admin?

    @list_everyting = pagy Entry.everything
  end
end
