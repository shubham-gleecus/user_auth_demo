class SuperAdminsController < ApplicationController
  before_action :ensure_super_admin_listing_access
  # GET /super_admins
  def index
    @super_admins= User.superadmins
    return if @error_response
  end

  # GET /super_admins/new
  def new
    @super_admin = User.new
  end

  # POST /super_admins
  def create
    @super_admin = User.new(super_admin_params)
    if @super_admin.save
      flash[:success] = 'Super Admin created successfully'
      redirect_to super_admins_path
    end
  end

  # GET /super_admins/:id
  def show
    @super_admin, @error_response = User.find(params[:id])
    render json: @error_response if @error_response
  end

  # DELETE /super_super_admins/:id
  def destroy
    @super_admin = User.destroy(params[:id])
    flash[:success] = 'Admin User deleted successfully'
    redirect_to super_admins_path
  end

  private

  def super_admin_params
    params.require(:user).permit(:full_name, :email, :password, :superadmin_role)
  end
end