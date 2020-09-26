ParameterType(
  name:        'temp_sensor_name',
  regexp:      /[a-zA-Z]/,
  type:        String,
  # The transformer takes as many arguments as there are capture groups in the regexp,
  # or just one if there are none.
  transformer: ->(s) { TempSensorName.new(s) }
)


ParameterType(
  name:        'lum_sensor_name',
  regexp:      /[a-zA-Z]/,
  type:        String,
  # The transformer takes as many arguments as there are capture groups in the regexp,
  # or just one if there are none.
  transformer: ->(s) { TempSensorName.new(s) }
)


When('it starts initializes temperature sensor {temp_sensor_name}, luminosity sensor {lum_sensor_name} and {actuators_count} actuators') do |temp_sensor_name, lum_sensor_name, actuators_count|
  @actuators = []
  @temperature_sensor = Sensors::Temperature.new(temp_sensor_name)
  @lum_sensor = Sensors::Luminosity.new(lum_sensor_name)
  actuators_count.times do |t| 
    @actuators << Actuators::Generic.new(t)
  end
end

Then('it enables them') do
  @temperature_sensor.enable
  @lum_sensor.enable
end

Then('it checks the network') do
  Network::Runner.check
end

Then('it start adaptation rules') do
  Rules::DsplAdapter.make_aware
end

