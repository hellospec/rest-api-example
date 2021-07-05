class HeroesController < ApplicationController
  def index
    heroes = Hero.all
    render json: heroes
  end

  def create
    hero = Hero.create!(hero_params)
    render json: hero
  end

  private

  def hero_params
    params.require('hero').permit(:name, :occupation, :gender, :level, :hp, :mp)
  end
end
