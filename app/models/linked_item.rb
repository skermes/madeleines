require 'open-uri'
require 'pismo'

PROTOCOL_REGEX = /^(https?|ftp):\/\//
TEXT_CONTENT_REGEX = /^text\//

class LinkedItem
  attr_reader :errors, :url
  attr_accessor :title, :preview

  def initialize(url)
    @url = url
    @errors = []
  end

  def valid?
    @errors.length == 0
  end

  def self.from_url(url)
    # There are a lot more ways someone could screw up a url, but this is
    # the most common.
    if not url =~ PROTOCOL_REGEX
      url = "http://#{url}"
    end

    item = LinkedItem.new(url)

    file = nil
    begin
      file = open(url)
    rescue SocketError
      item.errors.push :bad_url
      return item
    rescue
      item.errors.push :http_error
      return item
    end

    if not file.content_type =~ TEXT_CONTENT_REGEX
      item.errors.push :unknown_content_type
      return item
    end

    document = Pismo::Document.new(file)
    item.title = document.title
    item.preview = document.lede
    return item
  end
end
