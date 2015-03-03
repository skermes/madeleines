namespace :notifications do
  desc "Send daily notifications to all users"
  task :send => :environment do
    User.all.each do |user|
      remembrance = Remembrance.bite_for(user)
      notifier = NotifierFactory.build(user)
      notifier.send(remembrance)
    end
  end
end
