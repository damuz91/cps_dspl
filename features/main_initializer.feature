Feature: Initializer program starts
  As a worker machine
  I want the program to run app.rb
  So that it initializes the CPS program modules

  Scenario: Main script imports subclasses
    When it starts initializes temperature sensor A, luminosity sensor B and 2 actuators
    Then it enables them
    Then it checks the network
    Then it start adaptation rules