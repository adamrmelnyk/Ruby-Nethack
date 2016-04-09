Rect = Struct.new(:left, :top, :right, :bottom)
require_relative 'dungeon'
require_relative 'tileset'
require_relative 'room_generator'
require_relative 'room_renderer'
require_relative 'dungeon_printer'
class DungeonGenerator

  DEFAULT_WIDTH = 80
  DEFAULT_HEIGHT = 21
  DEFAULT_TILESET_NAME = "default"

  def initialize(options = {})
    @options = options
    @dungeon = Dungeon.new(width, height, tileset: tileset)
    @rects = [Rect.new(0, 0, width, height)]
  end

  def generate
    room = create_room
    render_room room
    dungeon
  end

private

  attr_reader :dungeon, :rects, :options

  def create_room
    RoomGenerator.new(rects.first).generate
  end

  def width
    options.fetch(:width, DEFAULT_WIDTH)
  end

  def height
    options.fetch(:height, DEFAULT_HEIGHT)
  end

  def render_room room
    room_renderer.new(room, dungeon).render
  end

  def room_renderer
    options.fetch(:room_renderer, RoomRenderer)
  end

  def tileset
    @_tileset ||= Tileset.load(tileset_name)
  end

  def tileset_name
    options.fetch(:tileset_name, DEFAULT_TILESET_NAME)
  end
end

dungeon = DungeonGenerator.new.generate
DungeonPrinter.new(dungeon).print
