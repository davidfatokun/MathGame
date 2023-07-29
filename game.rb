class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def start_game    
    loop do 
      question = MathQuestion.new 
      puts "#{@current_player.name}: #{question.question}"
      print "> "
      input = gets.chomp.to_i 
      if question.correct?(input) 
        puts "Yes! You are correct #{@current_player.name}" 
      else
        puts "No! You are wrong #{@current_player.name}" 
        @current_player.lose_life 
      end 
      
      break unless @current_player.alive? 

      switch_player 
      show_scores             
    end 
    end_game 
  end  

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def show_scores
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    puts "----- NEW TURN -----"
  end

  def end_game
    if @player1.alive?
      winner = @player1
      loser = @player2
    else
      winner = @player2
      loser = @player1
    end

    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end