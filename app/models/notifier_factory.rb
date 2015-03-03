class NotifierFactory
  def self.build(user)
    notification_strategy = user.settings_with_defaults['notifications']

    case notification_strategy
    when 'none'
      NoopNotifier.new(user)
    when 'email'
      EmailNotifier.new(user)
    when 'twitter'
      TwitterNotifier.new(user)
    else
      log_unknown_notification_strategy(user)
      NoopNotifier.new(user, notification_strategy)
    end
  end

  def self.log_unknown_notification_strategy(user, strategy)
    puts "Unknown notifications value #{strategy} for #{user}"
  end
end
