module FlywayRails
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.expand_path('../tasks/database_tasks.rake', __FILE__)
    end
  end
end
