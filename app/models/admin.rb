# frozen_string_literal: true

# The model should not be used and you're discouraged to use this model.
# This model was created for some misunderstood advice.
# And it works just like a problem-creating machine.
# Use the "Role" column if you want to create a new admin user.
# The model couldn't be removed because of some strange behavior welded by the Devise.
class Admin < ApplicationRecord
  extend Devise::Models

  devise :database_authenticatable, :rememberable

  @message = 'Use the User model with "Admin" role.
  \nCheckout for app/model/admin.rb file'

  def new
    raise @message
  end

  def create
    raise @message
  end

  def create!
    raise @message
  end
end
