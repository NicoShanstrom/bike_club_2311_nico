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

    describe 'personal_record(ride)' do
        it 'reports the lowest time recorded for a ride' do
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

            expect(biker.personal_record(ride1)).to eq(91.1)
            expect(biker.personal_record(ride2)).to eq(60.9)

            biker2 = Biker.new("Athena", 15)
            biker2.log_ride(ride1, 97.0) #biker2 doesn't know this terrain yet
            biker2.log_ride(ride2, 67.0) #biker2 doesn't know this terrain yet

            expect(biker2.rides).to eq({})

            biker2.learn_terrain!(:gravel)
            biker2.learn_terrain!(:hills)

            biker2.log_ride(ride1, 95.0) # biker2 can't bike this distance
            biker2.log_ride(ride2, 65.0) # biker2 knows this terrain and can bike this distance

            expect(biker2.rides).to eq({ ride2 => [65.0] })

            expect(biker2.personal_record(ride2)).to eq(65.0)
            expect(biker2.personal_record(ride1)).to eq(false)
        end
    end
end