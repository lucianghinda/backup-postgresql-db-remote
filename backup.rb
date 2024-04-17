require 'aws-sdk-s3'
require_relative 'db_config'
require_relative 'cloudflare_config'
require_relative 'output'
require 'dotenv/load'

class Backup
  def initialize(db_name: , remote_folder: "production_backups")
    @db_config = DBConfig.new(db_name:)
    @cloudflare_config = CloudflareConfig.new
    @output = Output.new(prefix: @db_config.db_name, remote_folder: remote_folder)
    @backup_created = false
    @arhive_created = false
  end

  def create
    fullpath = @output.fullpath("sql")
    system("#{@db_config.pg_dump} -h #{@db_config.db_host} -p #{@db_config.db_port} -U #{@db_config.db_user} #{@db_config.db_name} > #{fullpath}")

    if File.exist?(fullpath)
      puts "Backup file created at #{fullpath}"
      @backup_created = true
    end
  end

  def archive
    filename_tgz = @output.filename("tar.gz")
    filename_sql = @output.filename("sql")
    system("cd #{@output.local_folder}; tar czvf #{filename_tgz} #{filename_sql}")

    fullpath_tgz = @output.fullpath("tar.gz")
    if File.exist?(fullpath_tgz)
      puts "Archive file created at #{fullpath_tgz}"
      @arhive_created = true
    end
  end

  def state
    puts "Backup created: #{@backup_created}"
    puts "Archive created: #{@arhive_created}"
  end

  def upload
    s3 = Aws::S3::Resource.new(
      access_key_id: @cloudflare_config.key_id,
      secret_access_key: @cloudflare_config.secret_access,
      endpoint: @cloudflare_config.endpoint,
      region: 'auto',
      force_path_style: true
    )

    obj = s3.bucket(@cloudflare_config.bucket).object(@output.object_key("tar.gz"))
    obj.upload_file(@output.fullpath("tar.gz"))
  end
end
