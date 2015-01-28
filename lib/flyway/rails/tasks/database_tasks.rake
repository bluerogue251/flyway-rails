require 'shellwords'


def host
  Shellwords.escape(config['host'])
end

def port
  Shellwords.escape(config['port'].to_s)
end

def password
  password = Shellwords.escape(config['password'])
end

def user
  Shellwords.escape(config['user'])
end

def database
  Shellwords.escape(config['database'])
end

def config
  Rails.configuration.database_configuration[Rails.env]
end

def flyway_command_options
  "-url=jdbc:postgresql://#{host}:#{port}/#{database} " +
  "-user=#{user} " +
  "-password=#{password} " +
  "-sqlMigrationPrefix='' " +
  "-sqlMigrationSeparator=_ " +
  "-locations=filesystem:#{Flyway::Rails::MIGRATION_DIRECTORY}"
end

def executable_path
  File.expand_path("../../../../../flyway", __FILE__)
end

namespace :flyway do
  desc 'Migrate the database'
  task :migrate do
    command = "#{executable_path} migrate #{flyway_command_options}"
    puts "About to execute #{command}"
    system command
  end
end
