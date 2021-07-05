class Hero < ApplicationRecord
  before_create :initialize_profile

  enum gender: { male: "male", female: "female" }

  private

  def initialize_profile
    self.level = 1
    self.hp = 50
  end
end
