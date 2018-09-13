class Display
  @@MAX_LINE_LENGTH = 35
  def print_dialog(dialog)
    words = dialog.split(' ')
    line = ''
    while !words.empty?
      if (line + words.first + " ").length >= @@MAX_LINE_LENGTH
        puts "  " + line
        line = ''
      end
      line += words.shift + " "
    end
    puts "  " + line
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def await_confirmation
    gets.chomp
  end

  def display_dialog(dialog)
    clear_screen
    print_dialog(dialog)
    await_confirmation
  end

end
