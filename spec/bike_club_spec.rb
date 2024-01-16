require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
    describe 'initialize' do
        it 'initializes with a name and a list of bikers' do
            bike_club = BikeClub.new("Cruisers")
            expect(bike_club.name).to eq("Cruisers")
            expect(bike_club.list).to eq([])
        end
    end

    describe 'add_bikers' do
        it 'can add bikers' do
            bike_club = BikeClub.new("Cruisers")
            bike_club.add_biker("Sean")
            expect(bike_club.list).to eq(["Sean"])
        end
    end

    describe 'most_rides' do
        it 'can tell us which biker has logged the most rides' do
            bike_club = BikeClub.new("Cruisers")
            biker = Biker.new("Sean", 30)
            bike_club.add_biker("Sean")

            
            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, 
                            loop: false, terrain: :hills})
            ride2 = Ride.new({name: "Town Lake", distance: 14.9, 
                            loop: true, terrain: :gravel})
            biker.log_ride(ride1, 92.5)
            biker.log_ride(ride1, 91.1)
            biker.log_ride(ride2, 60.9)
            biker.log_ride(ride2, 61.6)

            expect(bike_club.most_rides).to eq("Sean")
        end
    end



end
