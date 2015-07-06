task :update_sightings do
  puts "Updating sightings..."
  puts `rails runner app/jobs/update_sightings_job.rb`
end
