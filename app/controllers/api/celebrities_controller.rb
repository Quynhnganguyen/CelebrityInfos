class Api::CelebritiesController < ApplicationController
  before_action :set_celebrity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @celebrities = Celebrity.all
    rendre json: @celebrities
  end

  def show
    respond_with(@celebrity)
  end

  def create
    @celebrity = Celebrity.new(celebrity_params)
    @celebrity.save
    respond_with(@celebrity)
  end

  def update
    @celebrity.update(celebrity_params)
    respond_with(@celebrity)
  end

  def destroy
    @celebrity.destroy
    respond_with(@celebrity)
  end
end
