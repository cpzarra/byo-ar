require 'pry'
class DragonsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render status: 200, json: Dragon.all
  end

  def show
    dragon = Dragon.where(id: params[:id]).first
    if dragon
      render status: 200, json: dragon
    else
      render status: 404
    end
  end

  def create
    dragon = Dragon.create(dragon_params)
    if dragon
      render status: 200, json: dragon
    else
      render status: 400
    end
  end

  def update
    dragon = Dragon.where(id: params[:id]).first
    if dragon.update(dragon_params.except(:id))
      render status: 200, json: dragon
    else
      render status: 400
    end
  end

  def search
    dragons = Dragon.where(name: params[:name])
    render status: 200, json: dragons
  end

  def dragon_params
    params.permit(:id, :name, :color)
  end
end