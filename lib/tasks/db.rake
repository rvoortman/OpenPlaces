# frozen_string_literal: true

namespace :db do
  desc "Drops all connections to the current database"
  task :drop_connections, [:database] => :environment do |t, args|
    config = (args[:database] || ActiveRecord::Base.configurations.find_db_config(Rails.env).database)
    ActiveRecord::Base.connection.query <<-SQL
      SELECT pg_terminate_backend(pg_stat_activity.pid)
      FROM pg_stat_activity
      WHERE pg_stat_activity.datname = '#{config}'
      AND pid <> pg_backend_pid()
    SQL
  rescue ActiveRecord::NoDatabaseError
  end
end
