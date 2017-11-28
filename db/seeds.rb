# frozen_string_literal: true

if Rails.env.development?
  AdminUser.create!(
    email: 'admin@example.com',
    password: 'test123', password_confirmation: 'test123'
  )
end
