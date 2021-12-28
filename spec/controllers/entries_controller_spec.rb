# frozen_string_literal: true

require "rails_helper"

RSpec.describe EntriesController, type: :controller do
  describe "GET /" do
    describe "logged in" do
      login_user
      it "returns the entries mainpage" do
        get :index
        expect(response).to be_successful
      end
    end

    describe "not logged in" do
      it "returns the greeter page" do
        get :index
        expect(response).to redirect_to(home_index_path)
      end
    end
  end

  describe "POST #create" do
    describe "logged in" do
      login_user
      it "creates new post and redirects to mainpage" do
        post :create, params: {
          entry: {
            comment: "Learning some artistic moves",
            category: "French Janissary Ninja Training",
            finished_at: nil,
            user_id: 1
          }
        }
        expect(response).to redirect_to(root_path)
      end
    end

    describe "not logged in" do
      it "redirect to the login page" do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET #create" do
    describe "logged in" do
    end
  end
end
