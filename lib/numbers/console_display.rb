require 'numbers/board'
require 'numbers/console_display'

module Numbers
  class ConsoleDisplay

    TILE_WIDTH = 10
    SEPARATOR = '|'.freeze

    attr_reader :player

    def initialize(player)
      @player = player
    end

    def display_board(board)
      display = []
      display << spacer(board.board_size)
      display << "Player: #{player}"
      display << "Score: #{board.score}"
      board.history.each do |history|
        display << "#{history.first}: #{history.last.join(' | ')}" 
      end
      display << spacer(board.board_size)
      display += board.tiles.each_slice(board.board_size).map do |group|
        group.map{|tile| (tile ? tile.value.to_s : '').center(8)}.join(SEPARATOR)
      end.reverse
      display.join("\n")
    end

    private

    def spacer(board_size)
      ('-' * (board_size * TILE_WIDTH))
    end

  end
end
