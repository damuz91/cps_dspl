require 'sinatra'
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/cps/actuators/*', &method(:require))
Dir.glob(project_root + '/cps/sensors/*', &method(:require))
Dir.glob(project_root + '/cps/network/*', &method(:require))
Dir.glob(project_root + '/cps/rules/*', &method(:require))

get '/' do
  sensors = [
    Sensors::Temperature.new('1'),
    Sensors::Temperature.new('2'),
    Sensors::Luminosity.new('1'),
    Sensors::Luminosity.new('2')
  ]
  actuators = [
    Actuators::Generic.new('1'),
    Actuators::Generic.new('2')
  ]
  sensors_report = sensors.map{|s| "-> #{s.to_s}"}.join('</br>')
  actuators_report = actuators.map{|a| "-> #{a.to_s}"}.join('</br>')
  enabling_report = sensors.map{|s| "-> #{s.enable}" }.join('</br>')
  %{
    Performing system check </br>
    1. Sensors check: </br>
    #{sensors_report}</br>
    2. Actuators check: </br>
    #{actuators_report}</br>
    3. Enabling sensors and actuators </br>
    #{enabling_report} </br>
    4. Checking network connection: </br>
    #{Network::Runner.check} </br>
    5. Enabling runtime rules adapters (DSPL): </br>
    #{Rules::DsplAdapter.make_aware}
    System check completed
  }
end