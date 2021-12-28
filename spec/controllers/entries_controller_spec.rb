# frozen_string_literal: true

require "rails_helper"

RSpec.describe EntriesController, type: :controller do
  shared_examples "if not signed in" do |request_type, namespace|
    it "redirects to the login page" do
      # It just behaves like "get :index"
      send request_type, namespace
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "#index" do
    describe "if signed in" do
      login_user
      it "returns the entries mainpage" do
        get :index
        expect(response).to be_successful
      end
    end

    describe "if not signed in" do
      it "returns the greeter page" do
        get :index
        expect(response).to redirect_to(home_index_path)
      end
    end
  end

  describe "#create" do
    describe "if signed in" do
      login_user
      it "creates new post and redirects to main page with notice" do
        post :create, params: {
          entry: {
            comment: "Learning some artistic moves",
            category: "French Janissary Ninja Training",
            finished_at: nil
          }
        }
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to be_present
      end
    end

    it_behaves_like "if not signed in", :post, :create
  end

  # describe "#show" do
  #   describe "if signed in" do
  #     login_user
  #     it "returns information about the entry" do
  #       get :show
  #       expect(response).to be_successful
  #     end
  #   end

  #   it_behaves_like "if not signed in", :get, :show
  # end

  describe "#finish" do
    describe "if signed in" do
      login_user
      describe "if there is an ongoing job" do
        it "finishes the last job with notice" do
          Entry.create!(
            comment: "Killing who don't like Chinese food",
            category: "Assasin",
            user_id: 1
          )

          post :finish
          expect(response).to redirect_to root_path
          expect(flash[:notice]).to be_present
        end
      end

      describe "if there is no ongoing job" do
        it "redirects to the main page with alert" do
          post :finish
          expect(response).to redirect_to new_entry_path
          expect(flash[:alert]).to be_present
        end
      end
    end

    it_behaves_like "if not signed in", :post, :finish
  end
end
