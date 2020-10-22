# Media Site API

Media Site API is a Rails-based system to manage your content site.
In this readme you going to find all basics to set up this project.

## Getting Started

After clone this repo, first thing you going to need is to have a PostgreSQL alreading installed and running.
If you havent't yet you can install it using this tutorial: https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos

This project uses `dotenv-rails`in development and test environments so make sure to create `.env` file into the app root. Env variables required are:
```
DATABASE_HOST
DATABASE_USER
DATABASE_PASSWORD
```

After set up this, You have to create your database. Let's Rails help us with that using:
```
rails db:create
rails db:migrate
```

Optionally, It's possible to populate the database with `rails db:seed` in case you want to start testing this API.

## Testing

To make tests this project uses `Rspec` as main Testing Framework in conjunction with `FactoryBot` and `Shoulda Matchers` gems.
Tests are located in `/specs` folder.

to run tests use this command in your console.

```
rspec
```

First time you run tests would be necessary to run `rails db:migrate RAILS_ENV=test` and `rails db:test:prepare`.

## Documentation
You can find Docs here: https://documenter.getpostman.com/view/4134914/TVYCBg1P
