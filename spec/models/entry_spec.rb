# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :model do
  it "is not valid without an category" do
    entry = Entry.create(
      comment: "Doing something weird",
      user_id: 1
    )
    p entry.errors[:category]
  end
end
