namespace :notifications do
  desc "Send daily notifications to all users"
  task :send => :environment do
    log_level = ActiveRecord::Base.logger.level
    ActiveRecord::Base.logger.level = Logger::INFO

    User.all.each do |user|
      remembrance = Remembrance.bite_for(user)
      notifier = NotifierFactory.build(user)
      notifier.send(remembrance)
    end

    ActiveRecord::Base.logger.level = log_level
  end
end
