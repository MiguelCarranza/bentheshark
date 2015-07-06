task :update_sightings do
  puts "Updating sightings..."
  puts `rails runner app/jobs/update_sightings_job.rb`
end

task :post_tweets do
  puts "Posting tweets..."
  puts `rails runner app/jobs/post_tweets_job.rb`
end

task :main_flow do
  puts "Running main flow..."
  puts `rails runner app/jobs/main_flow_job.rb`
end
