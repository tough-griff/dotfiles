# Format foreground text
module FG
  module_function

  def red(text)
    colorize_text(31, text)
  end

  def green(text)
    colorize_text(32, text)
  end

  def yellow(text)
    colorize_text(33, text)
  end

  def blue(text)
    colorize_text(34, text)
  end

  def magenta(text)
    colorize_text(35, text)
  end

  def cyan(text)
    colorize_text(36, text)
  end

  def gray(text)
    colorize_text(91, text)
  end

  def colorize_text(color, text)
    "\001\e[0;#{color}m\002#{text}\001\e[0m\002"
  end
end
