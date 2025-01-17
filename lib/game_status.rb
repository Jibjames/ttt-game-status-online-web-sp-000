# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    positions = [
      board[win_index_1],
      board[win_index_2],
      board[win_index_3]
      ]
      
    if positions.all? {|position| position == "X"} || positions.all? {|position| position == "O"} 
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  won?(board) || draw?(board) || full?(board)  
end

def winner(board)
  win_combo = won?(board)
  if win_combo != false
    return board[win_combo[0]]
  else
    return nil
  end
end