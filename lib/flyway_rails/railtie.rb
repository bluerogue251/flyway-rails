module FlywayRails
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.expand_path('../../tasks/flyway_rails.rake', __FILE__)
    end
  end
end
