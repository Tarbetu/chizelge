# frozen_string_literal: true

require "rails_helper"

RSpec.describe EntriesController, type: :controller do
  let(:valid_attributes) do
    {
      comment: "Learning some artistic moves",
      category: "French Janissary Ninja Training",
      finished_at: nil,
      user_id: 1
    }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    login_user
    it "returns the entries mainpage" do
      # Entry.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful # Belki de değildir?
    end
  end

  describe "GET #index without logging in" do
    it "redirects to root_path" do
      get :index, params: {}, session: valid_session
      expect(response).to have_http_status(302)
    end
  end
end
