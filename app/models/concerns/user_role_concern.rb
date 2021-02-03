module UserRoleConcern
  extend ActiveSupport::Concern
  included do
    # ==> Constants ---------------------------------------------------------
    # ==> Enums -------------------------------------------------------------
    # ==> Attr OR Custom attributes(Rails 5.0) if any -----------------------
    # ==> Associations/Relationships ----------------------------------------
    # ==> Scopes ------------------------------------------------------------
    scope :superadmins, -> { where(superadmin_role: true) }
    scope :supervisors, -> { where(supervisor_role: true) }

    # ==> Validations -------------------------------------------------------
    # ==> Callbacks ---------------------------------------------------------
  end
  # ==> Public Methods  -----------------------------------------------------

  def super_admin?
    superadmin_role?
  end

  def admin?
    admin_role?
  end

  def supervisor?
    supervisor_role?
  end

  # user can access admin panel who has role admin|super_admin
  def can_access_supervisor_listing?
    supervisor? || super_admin? || admin?
  end

  # user can access admin listing who has role super_admin
  def can_access_admin_listing?
    super_admin? || admin?
  end

  def can_access_super_admin_listing?
    super_admin?
  end
  # ==> Private Methods  ----------------------------------------------------
  # ==> Protected Methods  ------------------------------------------------
end