require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark

  end

  def losing_node?(evaluator)
    # evaluator is the mark of computer player, this method is called on
    # the node to determine if this is a losing move
  end

  def winning_node?(evaluator)
    # evaluator is the mark of computer player, this method is called on
    # the node to determine if this is a winning move
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    # find array of empty positions on board (children candidates)

    # create node by duping board and putting next_mover_mark in one of the empty positions

  end
end
