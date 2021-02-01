class AdminsController < ApplicationController
  before_action :ensure_admin_listing_access

  # GET /admins
  def index
    @admins= User.admins
    return if @error_response
  end

  # GET /admins/new
  def new
    @admin = User.new
  end

  # POST /admins
  def create
    @admin = User.new(admin_params)
    if @admin.save
      flash[:success] = 'Admin created successfully'
      redirect_to admins_path
    end
  end

  # GET /admins/:id
  def show
    @admin, @error_response = User.find(params[:id])
    render json: @error_response if @error_response
  end

  # DELETE /admins/:id
  def destroy
    @admin = User.destroy(params[:id])
    flash[:success] = 'Admin User deleted successfully'
    redirect_to admins_path
  end

  private

  def admin_params
    params.require(:user).permit(:full_name, :email, :password, :superadmin_role)
  end
end