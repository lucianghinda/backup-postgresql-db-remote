# frozen_string_literal: true

require_relative 'backup'

task :backup do
  backup = Backup.new(db_name: nil)
  backup.create
  backup.archive
  backup.upload
end
