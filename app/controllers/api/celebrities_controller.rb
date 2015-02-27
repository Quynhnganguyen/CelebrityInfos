class Api::CelebritiesController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_celebrity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @celebrities = Celebrity.all
    render json: @celebrities
  end

  def show
    @celebrity = Celebrity.where(id: params[:id])
    render json: @celebrity
  end

  def create
    @celebrity = Celebrity.new(celebrity_params)
    if @celebrity.save
      render json: @celebrity
    else
      render json: { :message => "Can not create celebrity "}
    end
  end

  def update
     @celebrity = Celebrity.find(params[:id])
    if @celebrity.update_attributes(celebrity_params)
      redirect_to celebrities_path, :notice => "User updated."
    else
      redirect_to celebrities_path, :alert => "Unable to update user."
    end
  end

  private
    def set_celebrity
      @celebrity = Celebrity.find(params[:id])
    end

    def celebrity_params
      params.require(:celebrity).permit(:name, :national, :domain)
    end
end
