class HeroesController < ApplicationController
  def index
    heroes = Hero.all
    render json: heroes
  end

  def create
    hero = Hero.new(hero_create__params)

    if hero.save
      render json: hero
    else
      render_error("cannot create hero")
    end
  end

  def show
    if hero = find_hero
      render json: hero
    else
      render_error("cannot find hero")
    end
  end

  def edit
    if hero = find_hero
      if hero.update(hero_update_params)
        render json: hero
      else
        render_error("cannot update hero")
      end
    else
      render_error("cannot find hero")
    end
  end

  private

  def hero_update_params
    hero_create_params
  end

  def hero_create_params
    params.require('hero').permit(:name, :job, :gender)
  end


  def render_error(msg)
    render json: { error: msg }, status: 500
  end

  def find_hero
    Hero.find_by_id params[:id]
  end
end
