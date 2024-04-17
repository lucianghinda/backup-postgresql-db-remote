# frozen_string_literal: true

class DBConfig
  attr_reader :db_name, :db_user, :db_password, :db_host, :db_port, :pg_dump

  def initialize(db_name:)
    @db_name = db_name || ENV.fetch("DB_NAME")
    @db_user = ENV.fetch("DB_USER")
    @db_password = ENV.fetch("DB_PASSWORD")
    @db_host = ENV.fetch("DB_HOST")
    @db_port = ENV.fetch("DB_PORT")
    @pg_dump = ENV.fetch("PG_DUMP_PATH")
  end
end
