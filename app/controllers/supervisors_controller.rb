class SupervisorsController < ApplicationController
  before_action :ensure_supervisor_listing_access

  # GET /supervisors
  def index
    @supervisors= User.supervisors
    return if @error_response
  end

  # GET /supervisors/new
  def new
    @supervisor = User.new
  end

  # POST /supervisors
  def create
    @supervisor = User.new(supervisor_params)
    if @supervisor.save
      flash[:success] = 'Supervisor created successfully'
      redirect_to supervisors_path
    end
  end

  # GET /supervisors/:id
  def show
    @supervisor, @error_response = User.find(params[:id])
    render json: @error_response if @error_response
  end

  # DELETE /supervisors/:id
  def destroy
    @supervisor = User.destroy(params[:id])
    flash[:success] = 'supervisor User deleted successfully'
    redirect_to supervisors_path
  end

  private

  def supervisor_params
    params.require(:user).permit(:full_name, :email, :password, :supervisor_role)
  end
end