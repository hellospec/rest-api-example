class HeroJob
  def self.available_jobs
    %w(squire knight white_mage black_mage monk holy_knight thief)
  end

  def self.default
    'squire'
  end

  def initialize(title)
    @title = title
  end

  def calculate_power(hero)
    new_hp = hero.hp * power_factor.fetch(:hp)
    new_mp = hero.mp * power_factor.fetch(:mp) 
    [new_hp, new_mp]
  end

  private

  def power_factor
    case @title
    when 'knight'
      { hp: 1.25, mp: 1.0 }

    when 'white_mage'
      { hp: 0.75, mp: 1.35 }

    when 'black_mage' 
      { hp: 0.8, mp: 1.25 }

    when 'monk'       
      { hp: 1.35, mp: 0 }

    else
      { hp: 1.0, mp: 1.0 }
    end
  end
end
