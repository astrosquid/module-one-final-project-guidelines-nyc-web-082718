require_relative '../config/environment'
require_relative '../tools/api_handler'
require_relative '../lib/game/display'

require 'pry'
require 'json'
require 'rest-client'
require 'io/console'

def welcome(dis)
  banner = File.read('./assets/banner.txt')
  puts banner
  puts ''
  dis.await_confirmation
end

bul = Pokemon.find_by(name: 'bulbasaur')
cha = Pokemon.find_by(name: 'charmander')
squ = Pokemon.find_by(name: 'squirtle')
pik = Pokemon.find_by(name: 'pikachu')
eev = Pokemon.find_by(name: 'eevee')

dis = Display.new
welcome(dis)

# INTRO

dis.display_dialog("Hello there! Welcome to the world of POKEMON! My name is OAK! People call me the POKEMON PROF!", "prof.oak")
dis.display_dialog("This world is inhabited by creatures called POKEMON! For some people, POKEMON are pets. Others use them for fights. Myself... I study POKEMON as a profession.", "prof.oak")
dis.display_dialog("First, what is your name?", "prof.oak")
print "NAME: "
name = gets.chomp
dis.display_dialog("Right! So your name is #{name.upcase}!", "prof.oak")
dis.display_dialog("This is my grandson. He's been your rival since you were a baby.", "prof.oak")
dis.display_dialog("...Erm, what is his name again?", "prof.oak")
print "NAME: "
rival = gets.chomp
dis.display_dialog("That's right! I remember now! His name is #{rival.upcase}!", "prof.oak")
dis.display_dialog("#{name.upcase}! Your very own POKEMON legend is about to unfold! A world of dreams and adventures with POKEMON awaits! Let's go!", "prof.oak")

dis.display_dialog('...', '')

# DIALOGUE WITH GARY BEFORE SELECTION

dis.display_dialog("Hey! Wait! Don't go out!", "prof.oak")
dis.display_dialog("It's unsafe! Wild POKEMON live in tall grass! You need your own POKEMON for your protection. I know! Here, come with me!", "prof.oak")

dis.display_dialog('...', '')

dis.display_dialog("Gramps! I'm fed up with waiting!", rival)
dis.display_dialog("#{rival.upcase}? Let me think... Oh, that's right, I told you to come! Just wait!", "prof.oak")
dis.display_dialog("Here, #{name.upcase}! There are 3 POKEMON here! Haha! They are inside the POKE BALLS. When I was young, I was a serious POKEMON trainer. In my old age, I have only 3 left, but you can have one! Choose!", "prof.oak")
dis.display_dialog("Hey! Gramps! What about me?", rival)
dis.display_dialog("Be patient! #{rival.upcase}, you can have one too!", "prof.oak")
dis.display_dialog("Now, RED, which POKEMON do you want?", "prof.oak")
dis.display_dialog("Heh, I don't need to be greedy like you! Go ahead and choose, RED!", rival)

dis.display_dialog('...', '')

# STARTER SELECTION (DIALOGUE, THEN MENU)

# DIALOGUE WITH GARY BEFORE FIRST FIGHT

# OPEN BATTLE SCREEN
