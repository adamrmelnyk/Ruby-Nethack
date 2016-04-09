class RoomRenderer
  def initialize(room, dungeon)
    @left = room.left
    @right = room.right
    @top = room.top
    @bottom = room.bottom
    @dungeon = dungeon
  end

  def render
    render_floor
    render_vertical_walls
    render_horizontal_walls
  end

private

  attr_reader :top, :left, :right, :bottom, :dungeon

  def render_floor
    left.upto(right) do |x|
      top.upto(bottom) do |y|
        dungeon.build(:floor, x, y)
      end
    end
  end

  def render_vertical_walls
    top.upto(bottom) do |y|
      dungeon.build(:veritcal_wall, left - 1, y)
      dungeon.build(:veritcal_wall, right + 1, y)
    end
  end

  def render_horizontal_walls
    (left - 1).upto(right + 1) do |x|
      dungeon.build(:horizontal_wall, x, top - 1)
      dungeon.build(:horizontal_wall, x, bottom + 1)
    end
  end
end
