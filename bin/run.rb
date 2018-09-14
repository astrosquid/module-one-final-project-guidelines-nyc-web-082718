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

dis.display_dialog "Hello there! Welcome to the world of POKEMON! My name is OAK! People call me the POKEMON PROF!"
dis.display_dialog "This world is inhabited by creatures called POKEMON! For some people, POKEMON are pets. Others use them for fights. Myself... I study POKEMON as a profession."
dis.display_dialog "First, what is your name?"
print "NAME: "
name = gets.chomp
dis.display_dialog "Right! So your name is #{name.upcase}!"
dis.display_dialog "This is my grandson. He's been your rival since you were a baby."
dis.display_dialog "...Erm, what is his name again?"
print "NAME: "
rival = gets.chomp
dis.display_dialog "That's right! I remember now! His name is #{rival.upcase}!"
dis.display_dialog "#{name.upcase}! Your very own POKEMON legend is about to unfold! A world of dreams and adventures with POKEMON awaits! Let's go!"

# STARTER SELECTION (DIALOGUE, THEN MENU)

# DIALOGUE WITH GARY BEFORE FIRST FIGHT

# OPEN BATTLE SCREEN
