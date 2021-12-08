# frozen_string_literal: true

# Controller for Entry model, for more information check the app/models/entry.rb
class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: %i[show edit update destroy]
  before_action :set_user, only: %i[index create finish]

  # GET /entries or /entries.json
  def index
    @pagy, @entries = pagy @user.entries.order("created_at DESC")
  end

  # GET /entries/1 or /entries/1.json
  def show; end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit; end

  # POST /entries or /entries.json
  def create
    @entry = Entry.new(entry_params)
    @entry.user = @user

    respond_to do |format|
      if @entry.save
        format.html { redirect_to root_path, notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /entries/finish
  def finish
    @entry = @user.last_work
    @entry.finished_at = Time.now

    @entry.save
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Well done!" }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Define the devise user
  def set_user
    @user = User.find(current_user["id"])
  end

  # Only allow a list of trusted parameters through.
  def entry_params
    params.require(:entry).permit(:comment, :category, :finished_at)
  end
end
