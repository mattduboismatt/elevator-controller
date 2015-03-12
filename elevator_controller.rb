require_relative 'elevator.rb'

class ElevatorController

  ALL_FLOORS = (1..100).to_a

  def initialize
    @elevator = Elevator.new
  end

  def run
    puts @elevator
    puts "Elevator commands: up"
    input = STDIN.gets.chomp.downcase
    if input == 'up'
      puts "Panel commands: floor number"
      input = STDIN.gets.chomp.downcase
      @elevator.add_floor_to_queue(input.to_i)
      @elevator.move
      puts @elevator
      puts "Interrupt with floor number, or c for continue"
      interrupt = STDIN.gets.chomp.downcase
      until @elevator.done?
        if interrupt == 'c'
          @elevator.move
          puts @elevator
        else
          @elevator.add_floor_to_queue(interrupt.to_i)
          puts @elevator
        end
        puts "Interrupt with floor number, or c for continue"
        interrupt = STDIN.gets.chomp.downcase
      end
    end
  end
end

c = ElevatorController.new
c.run