class Display
  @@MAX_LINE_LENGTH = 35
  def print_dialog(dialog, character)
    puts "    #{character.upcase}"
    words = dialog.split(" ") # or regex / / to keep newline
    line = ""
    while !words.empty?
      if words.first == "EOL"
        words.shift
        puts "  " + line
        line = ""
      elsif (line + words.first + " ").length >= @@MAX_LINE_LENGTH
        puts "  " + line
        line = ""
      end
      if !words.empty?
        line += words.shift + " "
      end
    end
    puts "  " + line
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def await_confirmation
    puts "    < enter > "
    gets.chomp
  end

  def display_dialog(dialog, character)
    clear_screen
    print_dialog(dialog, character)
    await_confirmation
  end

end
