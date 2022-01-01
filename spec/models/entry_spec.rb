# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :model do
  before(:all) { FactoryBot.create(:user) }
  let(:user) { User.first }
  context "validations" do
    before(:all) { FactoryBot.create(:user) }
    it "is valid if there is category, comment and user" do
      entry = Entry.new(
        comment: "Best thing ever!",
        category: "Bester",
        user: user
      )

      expect(entry.valid?).to be true
    end

    it "is not valid without an category" do
      entry = Entry.create(
        comment: "Doing something weird",
        user: user
      )
      expect(entry.errors[:category].first).to eq "can't be blank"
    end

    it "is not valid without an comment" do
      entry = Entry.create(
        category: "Being a freak",
        user: user
      )
      expect(entry.errors[:comment].first).to eq "can't be blank"
    end

    it "is not valid without an user" do
      entry = Entry.create(
        category: "Freaking",
        comment: "Freaking is freaking",
        user: user
      )
    end
  end

  describe "#finished?" do
    before(:all) do 
      DatabaseCleaner.clean
      FactoryBot.create(:entry)
    end
    subject { Entry.first }

    it "returns false if last job is not finished" do
      expect(subject.finished?).to be false
    end

    it "returns true if last job is finished" do
      subject.finished_at = Time.now
      subject.save
      expect(subject.finished?).to be true
    end
  end
end
