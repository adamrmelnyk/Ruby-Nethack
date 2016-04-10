class RoomGenerator
  MIN_WIDTH = 2
  MIN_HEIGHT = 2
  MAX_WIDTH_MODIFIER = 12
  MAX_HEIGHT_MODFIER = 4
  MAX_FLOOR_AREA = 50

  def initialize rect
    @rect = rect
  end

  def generate
    constrain_floor_area
    build_room
  end

private

attr_reader :rect

  def constrain_floor_area
    @width = 50 / height if floor_area > MAX_FLOOR_AREA
  end

  def build_room
    Rect.new(left, top, right, bottom)
  end

  def floor_area
    width * height
  end

  def height
    @height ||= MIN_HEIGHT + rand(MAX_HEIGHT_MODFIER)
  end

  def width
    @width ||= MIN_WIDTH + rand(MAX_WIDTH_MODIFIER)
  end

  def left
    @left ||= rect.left + 1 + rand(rect.right - width - 2)
  end

  def right
    @right ||= rect.right + 1 + rand(rect.bottom - height - 2)
  end

  def top
    @top ||= rect.top + 1 + rand(rect.bottom - height - 2)
  end

  def bottom
    @bottom ||= top + height
  end
end
