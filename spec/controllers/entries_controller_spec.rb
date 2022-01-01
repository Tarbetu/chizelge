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
      before(:each) do
        post :create, params: {
          entry: {
            comment: "Learning some artistic moves",
            category: "French Janissary Ninja Training",
            finished_at: nil
          }
        }
      end

      it "creates new job and redirects to main page" do
        expect(response).to redirect_to(root_path)
      end

      it "notices that you create an job" do
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
      before(:each) { post :finish }

      describe "when there is an ongoing job" do
        before(:each) do
          DatabaseCleaner.clean
          FactoryBot.create(:entry)
        end

        it "returns to main page" do
          expect(response).to redirect_to root_path
        end

        it "has an notice flash" do
          expect(flash[:notice]).to be_present
        end

        it "has not an alert flash" do
          expect(flash[:alert]).not_to be_present
        end
      end

      describe "when there is no ongoing job" do
        it "redirects to the new entry page" do
          expect(response).to redirect_to new_entry_path
        end

        it "has a alert flash" do
          expect(flash[:alert]).to be_present
        end

        it "has not an notice flash" do
          expect(flash[:notice]).not_to be_present
        end
      end
    end

    it_behaves_like "if not signed in", :post, :finish
  end
end
