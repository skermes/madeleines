# Tasks to modify existing data after migrations.

namespace :migrate do
  desc "Give everyone without an API key a new one"
  task :gen_api_keys => :environment do
    puts "Generating API keys:"
    User.where(:api_key => nil).each do |user|
      puts "\t#{user.email}"
      user.api_key = ApiKey.build
      user.save
    end
    puts "done"
  end
end
