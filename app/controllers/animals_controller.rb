class AnimalsController < ApplicationController
  before_action :set_animal, :only => [:show, :edit, :update, :destroy]
  before_action :set_race

  def index
    @animals = race_class.all
  end

  def show

  end

  def new
    @animal = race_class.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      flash[:notice] = "#{race} created successfully."
      redirect_to @animal
    else
      flash[:error] = 'There was a problem creating the new animal.'
      render :new
    end
  end

  def edit
  end

  def update
    if @animal.update(animal_params)
      flash[:notice] = "#{race} was updated sucessfully."
      redirect_to @animal
    else
      flash[:notice] = "#{@animal.name} could not be updated."
      render :edit
    end
  end

  def destroy
    @animal.destroy
    redirect_to animals_url
  end

  private

  def animal_params
    params.require(race.underscore.to_sym).permit(:race, :name, :age)
  end

  def set_race
    @race = race
  end

  def race
    Animal.races.include?(params[:type]) ? params[:type] : 'Animal'
  end

  def race_class
    race.camelize.constantize
  end

  def set_animal
    @animal = race_class.find(params[:id])
  end

end
