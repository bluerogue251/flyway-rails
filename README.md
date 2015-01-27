# flyway-rails
A thin wrapper around [flyway db](http://flywaydb.org) for Rails database migrations

Adds rake tasks to manage your database schema.

Add this gem to your Rails app:

```
gem 'flyway-rails', github: 'bluerogue251/flyway-rails'
```

In an initializer in your app, set the directory where you keep your migrations:

```
# config/initializers/flyway_rails.rb

Flyway::Rails::MIGRATION_DIRECTORY = 'path/to/your/migrations'
```

You can then list the new rake tasks by running:

```
$ rake -T | grep flyway
```
