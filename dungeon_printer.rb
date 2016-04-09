class DungeonPrinter
  def initialize(dungeon, io = STDOUT)
    @dungeon = dungeon
    @io = io
  end

  def print
    io.puts dungeon.rows.map(&:join)
  end

private

  attr_reader :io, :dungeon

end
