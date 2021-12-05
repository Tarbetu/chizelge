# frozen_string_literal: true

# Controller for Admin model
class AdminPagesController < ApplicationController
  before_action :authenticate_admin!

  def dashboard; end
end
