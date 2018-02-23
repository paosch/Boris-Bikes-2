class DockingStation
  attr_reader :array_of_bikes, :stored_bike

  DEFAULT_CAPACITY = 20 #class constant

  def initialize
    @array_of_bikes = []
    20.times{@array_of_bikes << Bike.new}
  end

  private
  def empty?
    if @array_of_bikes.length == 0
      true
    else
      false
    end
  end

  public
  def release_bike    #it { is_expected.to respond_to(:release_bike) }
    if empty? #expect { subject.release_bike }.to raise_error('There are no bikes')
      raise Exception.new("There are no bikes") #
    else
      @array_of_bikes.pop # removes bike from array
      Bike.new  #it { expect(subject.release_bike).to be_a Bike}
    end
  end

  private
  def full?
    if @array_of_bikes.length == DEFAULT_CAPACITY
      true
    else
      false
    end
  end

  public
  def return_bike # expect { subject.return_bike }.to raise_error('There is no space')
    if full?
      raise Exception.new("There is no space")
    else
      Bike.new >> @array_of_bikes # add the bike to the array, allow to dock a bike
    end
  end

#it { is_expected.to respond_to(:dock).with(1).argument }
  def dock(bike)
    @stored_bike = bike 
  end

end

class Bike
  def working?   #it { expect(subject.release_bike.working?).to eq true}
    true #it { subject.respond_to?('working?') }
  end
end
