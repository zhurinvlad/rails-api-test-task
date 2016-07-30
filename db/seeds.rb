# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).

unless Rails.env.test?
  user = User.create(
    email: 'develop4net@gmail.com', password: ENV['USER_PASSWORD'],
    first_name: 'Andrey', last_name: 'Krisanov', birthday: '15.12.1989',
    website: 'http://akrisanov.com', about: 'Software Engineer'
  )

  book = Book.create(
    isbn: '0321721330', title: 'Practical Object Oriented Design in Ruby',
    description: 'This book is spot on when it comes to object orientation.',
    pages: 247, website: 'http://www.poodr.info/', published: '2012-08-19'
  )

  author = Author.create(
    first_name: 'Sandi', last_name: 'Metz',
    about: 'Sandi Metz is a software developer and author focused on writing
     flexible object-oriented code in Ruby and Rails'
  )

  book.author = author
  book.save

  Review.create(text: 'Awesome book!', book: book, user: user)
end
