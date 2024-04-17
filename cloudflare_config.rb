# frozen_string_literal: true

class CloudflareConfig
  attr_reader :key_id, :secret_access, :endpoint, :bucket

  def initialize
    @key_id = ENV.fetch("CLOUDFLARE_ACCESS_KEY_ID")
    @secret_access = ENV.fetch("CLOUDFLARE_SECRET_ACESS_KEY")
    @endpoint = ENV.fetch("CLOUDFLARE_ENDPOINT")
    @bucket = ENV.fetch("CLOUDFLARE_BUCKET")
  end
end
