AdminUser.create!(
  email: 'admin@example.com',
  password: 'test123', password_confirmation: 'test123'
) if Rails.env.development?
