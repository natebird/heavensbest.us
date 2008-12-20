
# Create admin role
admin_role = Role.create(:name => 'admin')

# Create default admin user
user = User.create do |u|
  u.login = 'nate'
  u.password = u.password_confirmation = '123456'
  u.email = APP_CONFIG[:admin_email]
  u.name = 'Nate Bird'
end

# Activate user
user.register!
user.activate!

# Add admin role to admin user
user.roles << admin_role
