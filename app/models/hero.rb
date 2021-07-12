class Hero < ApplicationRecord
  before_create :initialize_profile

  enum gender: { male: "male", female: "female" }

  private

  def initialize_profile
    self.level = 1
    self.job = HeroJob.default if job.blank?
    
    init_hp_mp_by_job
  end

  def init_hp_mp_by_job
    hero_job = HeroJob.new(job)
    self.hp = hero_job.init_hp
    self.mp = hero_job.init_mp
  end
end
