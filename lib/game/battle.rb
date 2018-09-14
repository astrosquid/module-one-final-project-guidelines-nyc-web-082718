class Battle

  @@MAX_WIDTH = 44

  def initialize(display, player, opponent)
    @dis = display
    @player = player
    @opponent = opponent
    @player_pokemon = player.pokemon.first
    @opponent_pokemon = opponent.pokemon.first
  end

  def get_pokemon_types_text(pokemon)
    elements = pokemon.element_types
    text = " "
    elements.each do |element|
      text += "[#{element.name.upcase}]"
    end
    text
  end

  def make_line_text(left, right)
    left + right.rjust(@@MAX_WIDTH - left.length, " ")
  end

  def get_max_health_text
    max_health_size = 0
    if @@MAX_WIDTH % 2 == 0
      max_health_size = @@MAX_WIDTH - 2
    else
      max_health_size = @@MAX_WIDTH - 1
    end
    max_health_size = max_health_size / 2
    max_health_size -= 2
    health = "=" * max_health_size
    "<" + health + ">"
  end

  def create_battle_text
    player_name = "TRAINER " + @player.name.upcase
    player_pokemon = @player_pokemon.name.upcase
    player_pokemon_types = self.get_pokemon_types_text(@player_pokemon)
    player_pokemon_health = self.get_max_health_text

    opponent_name = "TRAINER " + @opponent.name.upcase
    opponent_pokemon = @opponent_pokemon.name.upcase
    opponent_pokemon_types = self.get_pokemon_types_text(@opponent_pokemon) + " "
    opponent_pokemon_health = self.get_max_health_text

    players_text = self.make_line_text(player_name, opponent_name)
    pokemon_text = self.make_line_text(player_pokemon, opponent_pokemon)
    types_text = self.make_line_text(player_pokemon_types, opponent_pokemon_types)
    health_text = self.make_line_text(player_pokemon_health, opponent_pokemon_health)

    [players_text, pokemon_text, types_text, health_text]
  end



  def draw_battle_screen
    @dis.clear_screen
    self.create_battle_text.each do |line|
      puts line
    end
    @dis.await_confirmation
  end

end
