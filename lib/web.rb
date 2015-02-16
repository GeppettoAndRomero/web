#require "web/version"
require "open-uri"
require "timeout"
require 'resolv-replace'

module Web
  @default = {
    :timeout => 3
  }
  def self.set_default(opt)
    @default.update(opt) if opt
  end
  def self.get(url,opt=nil)
    opt = if opt then @default.merge(opt) else @default end
    begin
      timeout(opt[:timeout]) do
        web = open(url,
             "User-Agent" => opt[:ua]
            )
      end
    rescue TimeoutError => e
      e
    rescue => e
      e
    end
  end

end

