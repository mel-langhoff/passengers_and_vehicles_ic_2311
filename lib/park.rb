class Park
    attr_reader :name, :admission_price, :vehicles

    def initialize(name, admission_price)
        @name = name
        @admission_price = admission_price
        @vehicles = []
    end

    def all_vehicles_in_park
        @vehicles
    end

    def add_vehicle(vehicle)
        @vehicles << vehicle
    end

    def all_passengers_in_park
        @vehicles.flat_map do |vehicle|
            vehicle.passengers
        end
    end

    def calculate_revenue
        adults = all_passengers_in_park.select do |passenger| 
            passenger.age >= 18
        end
        revenue = adults.size * @admission_price
        revenue
    end
end


