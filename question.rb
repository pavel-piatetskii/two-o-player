class Question

  attr_reader :question

  def initialize
    generate_question()
  end

  def generate_question
    num1 = rand(10)
    num2 = rand(10)
    action = ["plus", "minus", "multiply by"][rand(3)]
    @question = "What does #{num1} #{action} #{num2} equal?"
    
    case action
    when "plus"
      @answer = num1 + num2
    when "minus"
      @answer = num1 - num2
    when "multiply by"
      @answer = num1 * num2
    end

  end

  def check_answer(player_answer)
    @answer == player_answer.to_i
  end

end
