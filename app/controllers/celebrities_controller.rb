class CelebritiesController < ApplicationController
  before_action :set_celebrity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @celebrities = Celebrity.all
    respond_with(@celebrities)
  end

  def show
    respond_with(@celebrity)
  end

  def new
    @celebrity = Celebrity.new
    respond_with(@celebrity)
  end

  def edit
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

  private
    def set_celebrity
      @celebrity = Celebrity.find(params[:id])
    end

    def celebrity_params
      params.require(:celebrity).permit(:name, :national, :domain)
    end
end
