module Actuators
  class Generic

    attr_accessor :name
    def initialize(name)
      @name = name
    end

    def to_s
      "Generic actuator #{@name}"
    end
  end
end
