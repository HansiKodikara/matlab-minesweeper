% Purpose: flood fill- reveals all connected 0 cells and their number borders
% Parameters: gameBoard – current visibility state of the board
%             minefield – matrix with mine locations and number hints
%             row, col – coordinates of the cell clicked by the user
% Return values: gameBoard – updated board with revealed cells

function gameBoard = revealZeros(gameBoard,minefield,row,col)
    % Get dimensions of the board
    [numRows, numCols] = size(minefield);
    % Initialize vector of cells to process
    toCheck = [row,col];
    % creates a boolean matrix to track which cells were already checked
    % inisialize everything to false
    visited = false(numRows,numCols);
    
    % Keep checking until there are no more cells to reveal
    while ~isempty(toCheck)
        % Get the next cell to check
        checkRow = toCheck(1,1);
        checkCol = toCheck (1,2);
        % after storing the values removing it from vector
        toCheck(1,:) = [];
        % Continue only if the cell is inside the grid, not visited and not flagged
        if checkRow >= 1 && checkRow <= numRows &&...
            checkCol >= 1 && checkCol <= numCols &&...
            ~visited(checkRow,checkCol) && ...
            gameBoard(checkRow,checkCol) ~= 2

            % Mark the cell as visited 
            visited(checkRow,checkCol) = true;
            % Mark cell as revealed
            gameBoard(checkRow,checkCol) = 1; 
            
            % If current cell is 0, add all its surrounding cells to toCheck 
            if minefield(checkRow,checkCol) == 0
                % Loop through the 8 surrounding cells
                for newRow = checkRow-1:checkRow+1
                    for newCol = checkCol-1:checkCol+1
                        % Add cells that weren't visited and inside the grid to toCheck
                        if newRow >= 1 && newRow <= numRows && newCol >= 1 && newCol <= numCols && ~visited(newRow,newCol)
                            toCheck = [toCheck; newRow,newCol];

                        end
                    end
                end
            end
        end
    end
end