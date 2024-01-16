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

    most_active_biker = @list.max_by { |biker| biker.rides.values.count }&.name

    most_active_biker
    end
    
end