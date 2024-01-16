require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
    describe 'initialize' do
        it 'can have bikers with attributes' do
            biker = Biker.new("Kenny", 30)
            expect(biker.name).to eq("Kenny")
            expect(biker.max_distance).to eq(30)
            expect(biker.rides).to eq({})
            expect(biker.acceptable_terrain).to eq([])
        end
    end

    describe '#learn_terrain' do
        it 'can have a biker learn new terrain to add to acceptable_terrain array' do
            biker = Biker.new("Kenny", 30)
            biker.learn_terrain!(:gravel)
            biker.learn_terrain!(:hills)

            expect(biker.acceptable_terrain).to eq([:gravel, :hills])
        end
    end

    describe 'log_ride(ride, time)' do
        it 'can keep track of all of its previous rides and times for those rides' do
            biker = Biker.new("Kenny", 30)
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

            expect(biker.rides).to eq({ ride1 => [92.5, 91.1], ride2 => [60.9, 61.6]})
        end
    end
    
end