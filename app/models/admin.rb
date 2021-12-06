# frozen_string_literal: true

# The model for website administrators
# Check for db/seeds.rb file to first admin.
class Admin < ApplicationRecord
  extend Devise::Models

  devise :database_authenticatable, :rememberable
end
