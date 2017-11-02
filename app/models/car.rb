class Car

  def initialize(make, model_year)
    @make = make
    @model_year = model_year
    @speed = 0
    @lights = false
    @parking_brake = false
  end

  def make
    @make
  end

  def model_year
    @model_year
  end

  def speed
    @speed
  end

  def accelerate
    @speed = @speed + 10
  end

  def brake
    if @speed >= 7
      @speed = @speed - 7
    else
      @speed = 0
    end
  end

  def lights
    @lights
  end

  def light_status
    if @lights == false
      "Lights are off."
    else
      "Lights are on."
    end
  end

  def light_switch
    @lights = !@lights
  end

  def parking_brake
    @parking_brake
  end

  def parking_brake_status
    if @parking_brake == false
      "Parking brake is off."
    else
      "Parking brake is on."
    end
  end

  def parking_brake_switch
    @parking_brake = !@parking_brake
  end
end
