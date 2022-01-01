# frozen_string_literal: true

# The User, managed by Devise
class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entries

  def last_work
    entries.last
  end

  def working?
    return false if entries.last.nil?

    !last_work.finished?
  end

  def admin?
    role == "admin"
  end

  def toggle_adminship
    @role = if admin?
              ""
            else
              "admin"
            end
  end
end
