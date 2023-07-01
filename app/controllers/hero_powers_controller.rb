class HeroPowersController < ApplicationController
    def create
      hero = Hero.find_by(id: params[:hero_id])
      power = Power.find_by(id: params[:power_id])
  
      if hero && power
        hero_power = hero.hero_powers.create(power: power, strength: params[:strength])
        if hero_power.persisted?
          render json: hero.as_json(include: :powers)
        else
          render json: { errors: hero_power.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { errors: ['Hero or Power not found'] }, status: :not_found
      end
    end
  end
  