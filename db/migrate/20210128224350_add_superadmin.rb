class AddSuperadmin < ActiveRecord::Migration[6.0]
  def change
    User.create! do |u|
      u.email     = 'shubham@auth.com'
      u.full_name = 'Shubham'
      u.password  = '123456'
      u.superadmin_role = true
    end
  end
end
