# frozen_string_literal: true

# The main feature of this application
# Contains information about what is the user doing and when they started
class Entry < ApplicationRecord
  belongs_to :user

  validates :category, presence: true
  validates :comment, presence: true

  def finished?
    !!finished_at
  end

  def self.everything
    order "created_at DESC"
  end
end
