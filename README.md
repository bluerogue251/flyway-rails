# flyway-rails
A thin wrapper around [flyway db](http://flywaydb.org) for Rails database migrations

Adds rake tasks to manage your database shchema.

Add this gem to your Rails app `Gemfile` as such:

```
gem 'flyway-rails', github: 'bluerogue251/flyway-rails'
```

In an initializer in your app, set the constant Flyway::Rails::MIGRATION_DIRECTORY` equal to the path where you keep your migrations.

You can find the rake tasks and their descriptions by running `$ rake -T | grep flyway`.