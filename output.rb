# frozen_string_literal: true

require 'date'

class Output
  FOLDER = '/tmp'

  attr_reader :fullpath, :object_key

  def initialize(prefix: nil, remote_folder: "")
    @remote_folder = remote_folder
    @basename = nil
    @prefix = prefix
  end

  def basename
    return @basename if @basename

    @basename = "#{DateTime.now.strftime('%Y-%m-%d_%H-%M-%S')}"
    @basename = "#{@prefix}_#{basename}" if @prefix
    @basename
  end

  def filename(extension) = "#{basename}.#{extension}"

  def fullpath(extension) = @fullname = File.join(FOLDER, filename(extension))

  def object_key(extension) = File.join(@remote_folder, filename(extension))

  def local_folder = FOLDER
end
