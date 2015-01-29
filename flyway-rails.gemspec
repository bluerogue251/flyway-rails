Gem::Specification.new do |s|
  s.name        = 'flyway-rails'
  s.version     = '0.0.2'
  s.date        = '2015-01-26'
  s.summary     = "A thin wrapper for using flyway"
  s.description = "A thin wrapper for using flyway database migrations with Ruby on Rails"
  s.authors     = ['Teddy Widom']
  s.email       = 'theodore.widom@gmail.com'
  s.files       = ['lib/flyway/rails.rb', 'lib/flyway/rails/railtie.rb', 'lib/flyway/rails/tasks/database_tasks.rake']
  s.homepage    = 'https://github.com/bluerogue251/flyway-rails'
  s.license     = 'MIT'
end
