class UI
  include Curses

  def initialize
    noecho
    init_screen
  end

  def close
    close_screen
  end

  def message(y, x, string)
    x = x + cols if x < 0
    y = y + lines if y < 0

    setpos(y, x)
    addstr string
  end

  def choice_prompt(y, x, string, choices)
    message(y, x, string + " ")

    loop do
      choice = getch
      return choice if choices.include? choice
    end
  end

  def clear
    super
  end
end
