class Player
  attr_accessor :player, :blood, :manna

  def initialize(name = {})
    @player = name
    @blood = 100
    @manna = 40
    system("clear")
    menu_header()
    menu_content
    create_player()
  end

  #get value hash
  def [](index)
    player[index]
  end

  #before save to hash
  def []=(index, value)
    player[index] = value,blood,manna
    @index = index
  end

  def menu_header
    #menu
    puts "========================================="
    puts "=====# welcome to the Battle Arena #====="
    puts "-----------------------------------------"
  end

  def menu_content
    puts "Description: "
    puts '1. type "new" to create a character'
    puts '2. type "start" to begin the fight'
    puts '3. exit'
    puts "-----------------------------------------"
  end

  def create_player
    puts "Current Player: #{player.count}"
      player.each do | index, value |
        puts "- #{index}"
      end
    puts "*Max player 2 or 3"
    puts "-----------------------------------------"
  end
end
