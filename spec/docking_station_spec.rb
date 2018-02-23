require './lib/docking_station.rb'

describe DockingStation do
  DEFAULT_CAPACITY = 20
  it { is_expected.to respond_to(:release_bike) }
  it { expect(subject.release_bike).to be_a Bike}
  it { expect(subject.release_bike.working?).to eq true}
  it { is_expected.to respond_to(:dock).with(1).argument }
  it 'returns docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.stored_bike).to eq bike
  end

  it 'raises an error when there is no space available' do
    expect { subject.return_bike }.to raise_error('There is no space')
  end

  it 'raises an error when there are no bikes available' do
    DEFAULT_CAPACITY.times{ subject.release_bike }
    expect { subject.release_bike }.to raise_error('There are no bikes')
  end
end

describe Bike do
  it { subject.respond_to?('working?') }
end
