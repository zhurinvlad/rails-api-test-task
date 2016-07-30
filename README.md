# README

[![CircleCI](https://circleci.com/gh/akrisanov/bookshelf.svg?style=shield)](https://circleci.com/gh/akrisanov/bookshelf)

Inspired from http://goodreads.com.
API for managing books, authors, and personal reviews:

* Unauthorized user (Guest) can view books, authors, reviews, and users;
* Authorized user can add/update/delete books and authors;
* Authorized user can create reviews on the book and update/delete only his records.
* Authorized Admin user can manage all entities.

See the [task description](TASK.md).

API Documentation: http://docs.akrisanov1.apiary.io/

Application deployed on Heroku: https://bookshelfapi.herokuapp.com

## Environment

I prefer to use RVM and [dotenv](https://rubygems.org/gems/dotenv-rails/) for development environment configuration.

### Ruby version

RVM creates gemset based on `.ruby-version` and `.ruby-gemset`: `2.3.1@bookshelf`.

* Ruby 2.3.1
* Rails 5.0.0

## Dependencies

* PostgreSQL 9.4+

## Configuration

## Database creation

* `rails db:create`
* `rails db:migrate`

## Database initialization

* `rails db:seed`

## How to run the test suite

* `RAILS_ENV=test rails db:migrate`
* `rspec` runs tests/specs manually;
* `guard` runs test/specs automatically & intelligently when files are modified.

P.S. OSX `brew install terminal-notifier`

## Linters (code analyzers)

```bash
chmod +x run_all_linters.sh
./run_all_linters
```

See `linters` dir.

**[RubyCop](https://github.com/bbatsov/rubocop):**
* [Editor integration](https://github.com/bbatsov/rubocop#editor-integration);
* `rubocop`;
* `rubocop --format html -o rubocop.html`.

P.S. Atom: if you use RVM + Atom, your `executablePath` should include `wrappers` dir instead of `bin`.
E.g.: `/Users/akrisanov/.rvm/gems/ruby-2.3.1/wrappers/rubocop`.

**[Brakeman](https://github.com/presidentbeef/brakeman)**

* `brakeman`;
* `brakeman -o brakeman.html`.

**[Bullet](https://github.com/flyerhzm/bullet)**

Use Bullet for N+1 queries detection.

## Deployment instructions

* `git push heroku master`
