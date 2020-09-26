module Sensors
  class Temperature

    attr_accessor :name
    def initialize(name)
      @name = name
    end

    def to_s
      "Temperature sensor #{@name}"
    end

    def enable
      "-> Enabling sensor #{@name}"
    end
  end
end
