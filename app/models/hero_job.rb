class HeroJob
  def self.available_jobs
    %w(squire knight white_mage black_mage monk)
  end

  def self.default
    'squire'
  end
end