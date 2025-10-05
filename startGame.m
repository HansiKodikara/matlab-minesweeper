% Purpose: start the game by assigning difficulty, closing the difficulty window, and launching the game board
% Parameters: menu – button group with difficulty options and bg – the difficulty window to close
% Return values: None

function startGame(menu,bg)
    % Get the selected toggle button from the difficulty menu
    choice = menu.SelectedObject;
    
    % Assign grid sizes and number of mines according to difficulty
    switch choice.Tag
        case "easy"
             gridSize = 9;
             numMines = 10;
        case "medium"
             gridSize = 16;
             numMines = 40;
         case "hard"
             gridSize = 24;
             numMines = 99;
    end
  
    % Close the difficulty selection window
    close(bg);
    % Create the game board with the assigned grid size and number of mines
    drawGameBoard(gridSize, numMines);
end