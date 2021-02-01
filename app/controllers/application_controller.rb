class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!


  def sweetalert_flash(type, text, title = nil, timer: 25_000)
    sweetalert(text, title,
               icon: type,
               showConfirmButton: true,
               timer: timer,
               html: text,
               # persistent: 'Ok',
               timerProgressBar: true)
  end

  def after_sign_in_path_for(resource)
    home_path
  end

  def ensure_admin_panel_access
    return if current_user.can_access_admin_panel?

    # flash[:error] = I18n.t('unauthorized')
    sweetalert_flash('error', I18n.t('unauthorized'), 'Unauthorized', timer: 25_000)
    redirect_to root_path
  end

  def ensure_admin_listing_access
    return if current_user.can_access_admin_listing?

    # flash[:error] = I18n.t('unauthorized')
    sweetalert_flash('error', I18n.t('unauthorized'), 'Unauthorized', timer: 25_000)
    redirect_to root_path
  end

  def ensure_supervisor_listing_access
    return if current_user.can_access_supervisor_listing?

    # flash[:error] = I18n.t('unauthorized')
    sweetalert_flash('error', I18n.t('unauthorized'), 'Unauthorized', timer: 25_000)
    redirect_to root_path
  end
end
