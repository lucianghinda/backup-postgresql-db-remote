require 'optparse'
require_relative 'backup'

options = {}
OptionParser.new do |parser|
  parser.banner = "Usage: run.rb [options]"

  parser.on("-n", "--name NAME", "Database name") do |v|
    options[:name] = v
  end

  parser.on("-h", "--help", "Displays Help") do
    puts parser
    exit
  end
end.parse!

if options[:name]
  puts "Performing operations on the database named #{options[:name]}"
  backup = Backup.new(db_name: options[:name])
  backup.create
  backup.archive
  backup.upload
else
  puts "Database name is required. Use -h for help."
  exit
end
