
require_relative './scheduled_run'

every :hour do
  runner 'ScheduledRun.new.backup'
end
