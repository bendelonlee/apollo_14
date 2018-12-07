class AstronautsController < ApplicationController
  def index
    @average_age = Astronaut.average_age
    @astronauts = Astronaut.all
  end
end
