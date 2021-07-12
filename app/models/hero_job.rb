class HeroJob
  BASE_HP = 100
  BASE_MP = 70

  def self.available_jobs
    %w(squire knight white_mage black_mage monk)
  end

  def self.default
    'squire'
  end

  def initialize(title)
    @title = title
  end

  def init_hp
    case @title
    when 'squire'     then BASE_HP * 1.0 
    when 'knight'     then BASE_HP * 1.25
    when 'white_mage' then BASE_HP * 0.85
    when 'black_mage' then BASE_HP * 0.9
    when 'monk'       then BASE_HP * 1.33
    end
  end

  def init_mp
    case @title
    when 'squire'     then BASE_MP * 0
    when 'knight'     then BASE_MP * 0
    when 'white_mage' then BASE_MP * 1.35
    when 'black_mage' then BASE_MP * 1.25
    when 'monk'       then BASE_MP * 0
    end
  end
end
