class User < ApplicationRecord
  include UserRoleConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :async, :confirmable
  scope :admins, -> { where(admin_role: true) }
  scope :superadmins, -> { where(superadmin_role: true) }
  scope :supervisors, -> { where(supervisor_role: true) }
  scope :consumers, -> { where(supervisor_role: false).where(superadmin_role: false).where(admin_role: false) }
  after_create :send_admin_mail

  def send_admin_mail
    UserMailer.send_welcome_email(self).deliver_later
  end

  def email_temp_password
    send_temp_password
  end

  private

  def send_temp_password
    UserMailer.delay.send_temp_password_to_admin(email, password)
  end
end
