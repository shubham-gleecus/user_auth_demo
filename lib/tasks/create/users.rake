# frozen_string_literal: true

namespace :create do
  task users: :environment do
    desc 'Create Users'
    User.destroy_all

    # Super admins ----
    user = User.new(email: 'shubham@auth.com',
                    password: '123456',
                    full_name: 'Shubham',
                    superadmin_role: true)
    user.skip_confirmation!
    user.save!

    user = User.new(email: 'anil@auth.com',
                    password: '123456',
                    full_name: 'Anil',
                    admin_role: true)
    user.skip_confirmation!
    user.save!

    user = User.new(email: 'sammy@auth.com',
                    password: '123456',
                    full_name: 'Sammy',
                    supervisor_role: true)
    user.skip_confirmation!
    user.save!

    user = User.new(email: 'sam@auth.com',
                    password: '123456',
                    full_name: 'Sam')
    user.skip_confirmation!
    user.save!
  end
end
