require 'open-uri'
require 'pismo'

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
