require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
    describe 'initialize' do
        it 'initializes with a name and a list of bikers' do
            expect(bike_club.name).to eq("Cruisers")
            expect(bike_club.list).to eq([])
        end
    end
end
