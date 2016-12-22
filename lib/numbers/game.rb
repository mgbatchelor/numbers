require 'numbers/board'
require 'numbers/learner'
require 'numbers/console_display'

module Numbers
  class Game

    attr_reader :player, :board, :display

    def initialize(player)
      @player = player
      @board = Numbers::Board.new
      @display = Numbers::ConsoleDisplay.new(player)
    end

    def inspect
      display.display_board(board)
    end

    def slide(direction)
      board.slide(direction)
      self
    end

    def self.start(player)
      game = Game.new(player)
      puts game.inspect
      while(input = $stdin.readline.chomp) do
        exit if input == 'q'
        game.slide(translate(input))
        puts game.inspect
      end
    end

    def self.random(moves)
      game = Game.new("RANDOM")
      moves.times do
        rand_choice = case rand(100) + 1
          when  1..50   then Numbers::Board::SlideDirection::LEFT
          when 50..75   then Numbers::Board::SlideDirection::RIGHT
          when 75..98   then Numbers::Board::SlideDirection::DOWN
          when 98..100  then Numbers::Board::SlideDirection::UP
        end
        game.slide(rand_choice)
        puts game.inspect
      end
    end

    def self.translate(input)
      {
        'a' => Numbers::Board::SlideDirection::LEFT,
        's' => Numbers::Board::SlideDirection::DOWN,
        'w' => Numbers::Board::SlideDirection::UP,
        'd' => Numbers::Board::SlideDirection::RIGHT
      }[input]
    end
  end
end
