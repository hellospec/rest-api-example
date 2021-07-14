class Hero < ApplicationRecord
  before_create :initialize_profile
  before_update :update_power_by_job

  enum gender: { male: "m", female: "f" }

  BASE_HP = 100
  BASE_MP = 70

  validates :name, presence: true
  validates :name, uniqueness: true
  validate :with_existing_job

  private

  def initialize_profile
    self.level = 1
    self.hp = BASE_HP
    self.mp = BASE_MP
    self.job = HeroJob.default if job.blank?
    
    update_power_by_job
  end

  def update_power_by_job
    hero_job = HeroJob.new(job)
    new_hp, new_mp = hero_job.calculate_power(self)
    self.hp = new_hp
    self.mp = new_mp
  end

  def with_existing_job
    if HeroJob.available_jobs.exclude?(job)
      errors.add(:job, "is invalid")
    end
  end
end
