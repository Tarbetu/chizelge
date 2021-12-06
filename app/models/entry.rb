# frozen_string_literal: true

# Main feature of this application
# Contains information about what is the user doing and when they started
class Entry < ApplicationRecord
  belongs_to :user

  validates :category, presence: true
  validates :comment, presence: true

  # Sıkıntı olur mu diye kontrol et
  def finished?
    !!finished_at
  end
end
