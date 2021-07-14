class Hero < ApplicationRecord
  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute

  before_create :initialize_profile
  before_update :update_power_by_job

  enum gender: { male: "m", female: "f" }

  BASE_HP = 100
  BASE_MP = 0

  validates :name, presence: true
  validates :name, uniqueness: true
  validate :with_existing_job

  attr_accessor :image_medium_url, :image_thumbnail_url

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

  def host_url
    ENV.fetch('HOST_URL', '')
  end

  def attributes
    {
      'id' => '',
      'name' => '',
      'job' => '',
      'level' => '',
      'hp' => '',
      'mp' => '',
      'image_medium_url' => '',
      'image_thumbnail_url' => '',
      'updated_at' => ''
    }
  end

  def image_thumbnail_url
    return '' if image_url(:thumbnail).blank?
    host_url + image_url(:thumbnail)
  end

  def image_medium_url
    return '' if image_url(:medium).blank?
    host_url + image_url(:medium)
  end
end
