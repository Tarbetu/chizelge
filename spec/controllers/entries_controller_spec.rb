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
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #index without logging in" do
    it "redirects to root_path" do
      get :index, params: {}, session: valid_session
      expect(response).to redirect_to(root_path)
    end
  end

  describe "POST #create" do
    login_user
    it "creates new post and redirects to root_path" do
      post :create, params: {}, session: valid_session
      expect(response).to redirect_to(root_path)
    end
  end
end
