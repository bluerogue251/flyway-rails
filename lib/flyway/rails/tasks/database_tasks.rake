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

def execute_command(type)
  command = "#{executable_path} #{type} #{flyway_command_options}"
  puts "About to execute #{command}"
  system command
end

namespace :flyway do
  desc "Migrates the schema to the latest version. Flyway will create the metadata table automatically if it doesn't exist."
  task :migrate do
    execute_command('migrate')
  end

  desc "Drops all objects (tables, views, procedures, triggers, ...) in the configured schemas."
  task :clean do
    execute_command('clean')
  end

  desc "Prints the details and status information about all the migrations."
  task :info do
    execute_command('info')
  end

  desc "Validates the applied migrations against the ones available on the classpath."
  task :validate do
    execute_command('validate')
  end

  desc "Baselines an existing database, excluding all migrations up to and including baselineVersion."
  task :baseline do
    execute_command('baseline')
  end

  desc "Repairs the Flyway metadata table."
  task :repair do
    execute_command('repair')
  end
end
