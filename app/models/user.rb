class User < ApplicationRecord
  include UserRoleConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :admins, -> { where(superadmin_role: true) }
  scope :supervisors, -> { where(supervisor_role: true) }
  after_create :send_admin_mail
  def send_admin_mail
    UserMailer.send_welcome_email(self).deliver_later
  end
end
