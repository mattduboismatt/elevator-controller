require_relative '../elevator.rb'

describe Elevator do
  let(:elevator) { Elevator.new }
  describe '#new' do
    it 'creates an elevator object' do
      expect(elevator).to be_an_instance_of Elevator
    end
    it 'has door_status property set to closed' do
      expect(elevator.door_status).to eq false
    end
    it 'has floors_to_stop_at property as empty array' do
      expect(elevator.floors_to_stop_at).to eq []
    end
    it 'has current_floor property set to 1' do
      expect(elevator.current_floor).to eq 1
    end
  end
  describe '#go_up' do
    it 'increases current_floor by one' do
      expect{elevator.go_up}.to change(elevator.current_floor).from(1).to(2)
    end
  end
  describe '#go_down' do
    it 'decreases current_floor by one' do
      elevator.current_floor = 2
      expect{elevator.go_down}.to change(elevator.current_floor).from(2).to(1)
    end
  end
  describe '#go_to' do
    it 'sets current floor to 10' do
      elevator.go_to(10)
      expect(elevator.current_floor).to eq 10
    end
  end
end
