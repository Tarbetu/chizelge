# frozen_string_literal: true

# Controller for Users with "Admin" role
class AdminPagesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  # GET /admin_pages/dashboard
  def dashboard
    @list_everyting = pagy Entry.everything
  end

  # GET /admin_pages/result
  def result
    email_addresses = params[:email].split " "
    categories = params[:category].split " "
    from_date = parsing_param_to_datetime(:from)
    end_date = parsing_param_to_datetime(:end)
    range = from_date..end_date
    @pagy, @entries = pagy Entry.joins(:user).where(created_at: range).and(
      if email_addresses.empty?
        User.all
      else
        User.where(email: email_addresses)
      end
    ).and(
      if categories.empty?
        Entry.all
      else
        Entry.where(category: categories)
      end
    )
  end

  # POST /admin_pages/setadmin
  def setadmin
    email_address = params[:email]
    @user = User.find_by(email: email_address)
    if @user.toggle_adminship
      redirect_to admin_pages_panel_path, notice: "The role of #{@user.email} has been changed"
    else
      redirect_to admin_pages_panel_path, status: :unprocessable_entity
    end
  end

  private

  def parsing_param_to_datetime(date_type)
    args = []
    5.times do |num|
      num += 1
      args << params[:"#{date_type}(#{num}i)"].to_i
    end

    DateTime.new(*args)
  end

  def check_user
    render file: "public/404.html", status: :unauthorized unless User.find(current_user["id"]).admin?
  end
end
