class BenJob
  def perform
    raise 'Must be implemented in subclass'
  end

  def log_info(msg)
    Rails.logger.info msg
  end

  def log_error(msg)
    Rails.logger.error msg
  end
end