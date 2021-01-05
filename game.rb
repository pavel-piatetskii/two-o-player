
class Game

  def initialize
    @players = [Player.new("Player 1"), Player.new("Player 2")]
    @current_player = 0
    play()
  end

  # Main logic of the game
  def play

    greeting()

    # Continiuossly switch between players asking questions until
    # one of them loses all lives
    while true
      turn() 
      
      if lost_all_lives()
        break
      end

      show_status()
      switch_player()
    end
    switch_player()
    gameover()
  end

  # Game turn where a question is generated and a player answers it
  def turn
    puts "\n----------------- NEW TURN -----------------"
    question = Question.new
    name = @players[@current_player].name
    puts "#{name}: #{question.question}"

    print "Answer: "
    answer = gets.chomp
    
    if question.check_answer(answer)
      puts "#{name}: Yes! You are correct!"
    else
      puts "#{name}: Seriously? No!"
      @players[@current_player].lose_life
    end
  end

  # Change current player
  def switch_player
    @current_player = (@current_player == 0) ? 1 : 0
  end

  # Check if current user lost all lives
  def lost_all_lives
    @players[@current_player].lives == 0
  end

  # Output a message with lives info for both players
  def show_status
    name1 = @players[0].name
    name2 = @players[1].name
    lives1 = @players[0].lives
    lives2 = @players[1].lives
    puts "#{name1}: #{lives1}/3 vs #{name2}: #{lives2}/3"
  end

  # Shorthand for current player name
  def cur_name
    @players[@current_player].name
  end

  # Shorthand for current player lives
  def cur_lives
    @players[@current_player].lives
  end

  def greeting
    puts "\n--------------------------------------------"
    puts "--== Welcome to TwO-O-Player Math Game! ==--"
    puts "--------------------------------------------"
  end

  def gameover
    puts "\n#{cur_name()} wins with a score of #{cur_lives()}/3"
    puts "      - - - = = = GAME OVER = = = - - -"
    puts "Good bye!"
  end

end