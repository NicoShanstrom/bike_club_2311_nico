class BikeClub
    attr_reader :name, :list


    def initialize(name)
        @name = name
        @list = []
        
    end

    def add_biker(biker)
        @list << biker
    end

    def most_rides
        most_active_biker = @list.keys.max_by { |name| @list[name].rides.count }
  
        most_active_biker
    end
  
end