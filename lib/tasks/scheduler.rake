desc "Sends a text message of the top NYT story"
task :nyt_top_story => :environment do
  Twilio::Client.new.run
end
