module Sensors
  class Luminosity

    attr_accessor :name
    def initialize(name)
      @name = name
    end

    def to_s
      "Luminosity sensor #{@name}"
    end

    def enable
      "-> Enabling sensor #{@name}"
    end
  end
end
