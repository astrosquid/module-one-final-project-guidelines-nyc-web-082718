class Menu
  def initialize(display, action, confirm=false, confirm_q='')
    @display = display
    @action = action # "Choose a POKEMON"
    @confirm = confirm
    @confirm_q = confirm_q # "choose this POKEMON"
  end

  def prompt
    @display.display_dialog(@action + '.', '')
  end

  def add_options(options=[])
    @options = options
  end

  def display_options
    op_string = ""
    c = 1
    @options.each do |op|
      op_string += "#{c.to_s}: #{op.name.upcase} EOL "
      c += 1
    end
    binding.pry
    @display.display_dialog(op_string, '')
    print "INPUT: "
    choice = gets.chomp.to_i
  end

  def selection(input)
    @options[input-1]
  end

  # Prompt yes or no.
  def confirmation?
    @display.display_dialog("Are you sure you want to #{@confirm_q}?", '')
    print "INPUT [y/N]: "
    input = gets.chomp
    unless input == 'y' || input == 'yes'
      return false
    end
    return true
  end
end
