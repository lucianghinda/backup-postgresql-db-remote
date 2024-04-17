require_relative 'backup'

class ScheduledRun
  def initialize
    @backup = Backup.new(db_name: nil)
  end

  def backup
    @backup.create
    @backup.archive
    @backup.upload
  end
end
