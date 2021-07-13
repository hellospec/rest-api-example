class Hero < ApplicationRecord
  before_create :initialize_profile

  enum gender: { male: "m", female: "f" }

  validates :name, presence: true
  validates :name, uniqueness: true, on: :create
  validate :with_existing_job, on: :create

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

  private

  def with_existing_job
    if HeroJob.available_jobs.exclude?(job)
      errors.add(:job, "is invalid")
    end
  end
end
