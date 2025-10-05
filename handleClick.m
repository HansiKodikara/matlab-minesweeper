% Purpose: Handles left and right mouse clicks on the game board to reveal cells, place flags or end the game
% Parameters: ~,~ – required for callback but not used
% Return values: None

function handleClick(~,~) % Source: https://au.mathworks.com/matlabcentral/answers/394981-too-many-input-arguments-trouble-using-callback-to-call-my-function#answer_315179
    % Get current game state from UserData of the figure
    data = get(gcf, "UserData");
    gameBoard = data.gameBoard;
    gridSize = data.gridSize;
    minefield = data.minefield;
    numMines = data.numMines;
    
    % Check if game is over and if it is don't continue
    if data.gameOver == true
        return;
    end
    
    % Get row and column of the clicked cell by rounding mouse click coordinates
    clickedCoordinates = get(gca,"CurrentPoint");
    col = floor(clickedCoordinates(1,1) + 0.5);  % X position → col
    row = floor(clickedCoordinates(1,2) + 0.5);  % Y position → row
    
    % Check if click was inside the grid if not don't continue
    if row < 1 || row > gridSize || col < 1 || col > gridSize
        return;
    end

     if ~data.firstClickDone
        % On first click generate the minefield and reveal area around click 
        % Play the first click sound effect
        playSound("first");
        minefield = generateMinefield(gridSize,numMines,row,col);
        gameBoard = revealZeros(gameBoard, minefield, row, col);
        % Update game state to first click is done and update minefield
        data.firstClickDone = true;
        data.minefield = minefield;
     else
        % Check if click was within bound 
        if row >= 1 && row <= gridSize && col >= 1 && col <= gridSize

            % Find if it was a left click or right click
            clickType = get(gcf,"SelectionType");

            if strcmp(clickType, "normal")  % Left click: reveal
                % If it's a mine, play sound, end game, and show all mines
                if minefield(row,col) == -1
                    playSound("mine")
                    data.gameOver = true;
                    set(gcf, "UserData", data);
                    endGame(gameBoard,minefield,false);
                    return;
                % If it’s a 0, call flood fill 
                elseif minefield(row, col) == 0
                    playSound("click");
                    gameBoard = revealZeros(gameBoard, minefield, row, col);
                % If it’s not flagged, reveal the cell normally
                elseif gameBoard(row,col) ~= 2
                    playSound("click");
                    gameBoard(row, col) = 1;  % Reveal
                end

            elseif strcmp(clickType, "alt")  % Right-click flag
                playSound("flag")
                % Toggle flag status and update flag counter
                if gameBoard(row, col) == 2
                    gameBoard(row, col) = 0;  % Unflag
                    data.flagsRemaining = data.flagsRemaining + 1;
                elseif gameBoard(row, col) == 0
                    gameBoard(row, col) = 2;  % Flag
                    data.flagsRemaining = data.flagsRemaining - 1;
                end
            end
        end 
     end
     % Update and save the game state
     data.gameBoard = gameBoard;
     set(gcf, "UserData", data);
     % redraw the board
     updateGameBoard(gameBoard,minefield);  

    % Check win condition if all non-mine cells revealed, open win window
    if sum(gameBoard == 1,"all") == sum(minefield ~= -1,"all")
        data.gameOver = true;
        set(gcf, "UserData", data);
        endGame(gameBoard,minefield,true);
    end
end