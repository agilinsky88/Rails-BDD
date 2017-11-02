class CarsController < ApplicationController
  def index

    render 'index.html.erb'
  end

  def create
    make = params[:make]
    model_year = params[:model_year]
    @car = Car.new(make, model_year)
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def accelerate
    @car = YAML.load(session[:car])
    if @car.parking_brake == false
      @car.accelerate
    end
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def brake
    @car = YAML.load(session[:car])
    @car.brake
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def light_switch
    @car = YAML.load(session[:car])
    @car.light_switch
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def parking_brake_switch
    @car = YAML.load(session[:car])
    if @car.speed == 0
      if params[:Ebrake] == "brake_on" && @car.parking_brake == false
        @car.parking_brake_switch
      elsif params[:Ebrake] == "brake_off" && @car.parking_brake == true
        @car.parking_brake_switch
      end
    end
    session[:car] = @car.to_yaml
    render 'create.html.erb'
  end
end
