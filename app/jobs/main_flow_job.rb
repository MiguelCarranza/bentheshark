class MainFlowJob < BenJob
  def perform
    log_info 'Starting main flow...'
    
    UpdateSightingsJob.new.perform
    PostTweetsJob.new.perform

    log_info 'Main flow finished successfully!'
  end
end

if __FILE__ == $0
  MainFlowJob.new.perform
end