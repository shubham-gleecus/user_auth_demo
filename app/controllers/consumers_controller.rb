class ConsumersController < ApplicationController
  before_action :ensure_supervisor_listing_access

  # GET /consumers
  def index
    @consumers= User.consumers
    return if @error_response
  end

  # GET /consumers/new
  def new
    @consumer = User.new
  end

  # POST /consumers
  def create
    @consumer = User.new(consumer_params)
    if @consumer.save
      flash[:success] = 'Consumer created successfully'
      redirect_to consumers_path
    end
  end

  # GET /consumers/:id
  def show
    @consumer, @error_response = User.find(params[:id])
    render json: @error_response if @error_response
  end

  # DELETE /consumers/:id
  def destroy
    @consumer = User.destroy(params[:id])
    flash[:success] = 'consumer User deleted successfully'
    redirect_to consumers_path
  end

  private

  def consumer_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end