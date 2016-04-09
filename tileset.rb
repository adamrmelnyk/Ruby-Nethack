require_relative "data_loader"

class Tileset
  def self.load(name, loader: DataLoader)
    data = loader.load_file("tilesets/#{name}")
    new data
  end

  def initialize tiles
    @tiles = tiles
  end

  def [](key)
    tiles[key]
  end

private

  attr_reader :tiles

end
