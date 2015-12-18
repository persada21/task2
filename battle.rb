load "player.rb"
class Battle < Player
  def game_play(attack, attacked)
    player[attack][2] -= 5
    player[attacked][1] -= 20

    if player[attack][1] == 0 || player[attack][2] == 0 || player[attacked][1] == 0 || player[attacked][2] == 0
      game_over(attack, attacked)
      @@condition = false
    else
      puts ""
      puts "Description:"
      puts "#{attack} : blood = #{player[attack][1]}, manna = #{player[attack][2]}"
      puts "#{attacked} : blood = #{player[attacked][1]}, manna = #{player[attacked][2]}"
      puts ""
    end
  end

  def game_over(tmp_attack, tmp_attacked)
    if player[tmp_attack][1] != 0 || player[tmp_attack][2] != 0
      winner = tmp_attack
    elsif player[tmp_attacked][1] != 0 || player[tmp_attacked][2] != 0
      winner = tmp_attacked
    end
    system("clear")
    puts "========================================="
    puts "=========#      GAME OVER      #========="
    puts "-----------------------------------------"
    puts "The winner is : #{winner}"
    puts "-----------------------------------------"
    puts "========# Thanks for playing :) #========"
  end
end

battle = Battle.new()
@@condition = true
while @@condition.eql? true
  print "Your choice? "
  choice = gets.chomp
  case choice
  when "new"
    if battle.player.count.eql? 3
      puts "You have reach your max player!"
      puts 'Type "start" for start Battle.'
      puts ""
    else
      print "Put Player Name: "
      player_name = gets.chomp
      battle[player_name] = player_name
      system("clear")
      battle.menu_header()
      battle.menu_content()
      battle.create_player
    end
  when "start"
    if battle.player.count.eql? 0
       puts "Create new Character first!"
       puts ""
    elsif battle.player.count.eql? 1
       puts "You can't start battle with one Character!"
       puts "Create one more new Character again."
       puts ""
    else
      
      battle.menu_header()
      battle.create_player()
      puts "Battle Start: "
      print "who will attack   : "
      player_attack = gets.chomp
      print "who will attacked : "
      player_attacked = gets.chomp
      if battle.player.has_key?(player_attack) == true && battle.player.has_key?(player_attacked) == true
        if player_attack == player_attacked
          puts "You can't attack yourself!"
          puts "Please try again ;-)"
          puts ""
        else
          battle.game_play(player_attack, player_attacked)
        end
      else
        puts "There's no player in list!"
        puts "Please try again ;-)"
        puts ""
      end
    end
  when "exit"
    @@condition = false
  end
end

#trace code
# attack = battle["tes1"][1] - battle["tes2"][1]
# puts attack
# puts battle.player.count
# puts battle["tes1"][1]
# puts battle["tes2"][2]
#
# puts battle.player.has_key?("tes1")
# puts battle.player.has_value?("tes1")
# puts battle.player # => {:a=>3, :b=>4}
