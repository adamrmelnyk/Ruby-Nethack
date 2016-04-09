class Game
  require "title_screen"

  TRAITS = [Role, Race, Alignment]

  def initialize
    @ui = UI.new
    @options = { quit: false, randall: false }
    at_exit { ui.close; pp options }
  end

  def run
    title_screen
    setup_character
  end

private

  attr_reader :ui, :options

  def title_screen
    TitleScreen.new(ui, options).render
    quit?
  end

  def select_screen
    SelectionScreen.new(Role, ui, options).render
  end

  def quit?
    exit if options[:quit]
  end

  def setup_character
    get_traits
    options[:player] = make_player
  end

  def get_traits
    TRAITS.each do |trait|
      SelectionScreen.new(trait, ui, options).render
      quit?
    end
  end

  def make_player
    Player.new(options).tap do
      %i(role race gender alignment).each { |key| options.delete key }
    end
  end
end
