# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).

unless Rails.env.test?
  User.create(
    email: 'develop4net@gmail.com', password: ENV['USER_PASSWORD'],
    first_name: 'Andrey', last_name: 'Krisanov', birthday: '15.12.1989',
    website: 'http://akrisanov.com', about: 'Software Engineer'
  )
end
