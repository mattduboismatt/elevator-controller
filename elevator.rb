require 'pry'
class Elevator

  def initialize
    @current_floor = 1
    @all_floors = (1..100).to_a
    @floors_to_stop_at = []
    @direction = 'up'
    @door_status = 'closed'
  end

  def go_to(floor)
    binding.pry
    if @current_floor < floor
      go_up
    elsif @current_floor > floor
      go_down
    else
      @floors_to_stop_at.delete(floor)
    end
  end

  def add_floor_to_queue(floor)
    @floors_to_stop_at << floor
    @floors_to_stop_at.sort.uniq!
  end

  def done?
    @floors_to_stop_at.empty?
  end

  def move
    if @direction == 'up'
      next_index = @all_floors.index(@current_floor) + 1
      go_to(@all_floors[next_index])
    else
      next_index =  @all_floors.index(@current_floor) -1
      go_to(@all_floors[next_index])
    end
  end

  def to_s
    <<-DOC
---------------------------------------------
Amazing Elevator At Your Service
current floor: #{@current_floor}
going #{@direction}
next stops: #{@floors_to_stop_at.join(',')}
    DOC
  end

  private
  def go_down
    @direction = 'down'
    @current_floor -= 1
  end
  def go_up
    @direction = 'up'
    @current_floor += 1
  end

end