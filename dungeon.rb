class Dungeon
  attr_reader :rows

  def initialize(width, height, tileset:)
    @tileset = tileset
    @rows = Array.new(height) { Array.new(width) { tileset[:stone] } }
  end

  def build(type, x, y)
    rows[y][x] = tileset[type]
  end

private

  attr_reader :tileset
end
