# frozen_string_literal: true

admin = User.find_by(email: 'admin@project.com')
user = User.find_by(email: 'user@project.com')

if admin.blank?
  admin = User.create(email: 'admin@project.com', password: 'password', password_confirmation: 'password', first_name: 'admin', title: 'Mr', confirmed_at: Time.now.utc)
  admin.skip_confirmation!
  admin.skip_confirmation_notification!
  admin.add_role :admin
end

if user.blank?
  user = User.new(email: 'user@project.com', password: 'password', password_confirmation: 'password', first_name: 'user', title: 'Mr', confirmed_at: Time.now.utc)
  user.skip_confirmation!
  user.skip_confirmation_notification!
  user.save
end
