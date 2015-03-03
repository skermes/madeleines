class TwitterNotifier
  MAX_CHARS = 140
  # https://support.twitter.com/articles/78124-how-to-post-shortened-links-urls
  LINK_LENGTH = 22

  @@twitter = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_CONSUMERKEY']
    config.consumer_secret     = ENV['TWITTER_CONSUMERSECRET']
    config.access_token        = ENV['TWITTER_ACCESSTOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESSTOKENSECRET']
  end

  def initialize(user)
    @user = user
  end

  def send(remembrance)
    begin
      if can_tweet?
        @@twitter.update build_tweet(remembrance)
        log_success
      else
        log_cant_tweet
      end
    rescue Exception
      log_error($!)
    rescue StandardError
      log_error($!)
    end
  end

  private

  def build_tweet(remembrance)
    mention = "@#{@user.settings_with_defaults['twitter']} "
    link = " #{remembrance.url}"

    # 1 for space in front of link
    available_characters = MAX_CHARS - LINK_LENGTH - 1 - mention.length

    text = "#{remembrance.title} - #{remembrance.preview}"
    if text.length > available_characters
      text = "#{text[0, available_characters - 3]}..."
    end

    "#{mention}#{text}#{link}"
  end

  def can_tweet?
    settings = @user.settings_with_defaults
    !settings['twitter'].nil? and !settings['twitter'].strip.empty?
  end

  def log_cant_tweet
    puts "Can't send daily tweet to #{@user}, no twitter handle in settings"
  end

  def log_success
    puts "Successfully sent daily tweet to #{@user}"
  end

  def log_error(error)
    puts "Exception thrown while sending daily tweet to #{@user}"
    puts "#{error}"
    puts "\t#{error.backtrace.join("\n\t")}"
  end
end
