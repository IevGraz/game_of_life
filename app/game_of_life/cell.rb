class Cell
  LIVE = 'O'
  DEAD = 'X'

  attr_reader :state

  def initialize(state = nil)
    @state = state ? state : LIVE
  end

  def dead
    @state = DEAD
  end

  def move_to_next_generation(neighbours)
    @state = next_state(neighbours)
  end

  private

  def next_state(neighbours)
    live_neighbours_count = neighbours.select { |n| n.state == LIVE }.count

    if @state == LIVE
      return LIVE if [2,3].include?(live_neighbours_count)

      return DEAD
    end

    return LIVE if live_neighbours_count == 3

    DEAD
  end
end
