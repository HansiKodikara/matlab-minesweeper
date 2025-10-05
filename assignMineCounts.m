% Purpose: Calculate number of adjacent mines for each non-mine cell in the minefield
% Parameters: minefield – matrix with -1 for mines and 0 for non-mine cells
% Return values: minefield – updated minefield matrix with cells having number of adjacent mines (0–8).

function minefield = assignMineCounts(minefield)
    % Get the size of the minefield
    [numRows,numCols] = size(minefield);
    % Loop through each cell in the grid
    for row = 1:numRows
        for col = 1:numCols
                % Only count mines if the current cell is not a mine
                if minefield(row,col) ~= -1
                    % find the grid around current cell - only cells in the grid
                    rowMin = max(1, row - 1);
                    rowMax = min(numRows, row + 1);
                    colMin = max(1, col - 1);
                    colMax = min(numCols, col + 1);
        
                    % Initialize mine counter
                    count = 0;

                    % Count how many mines are in the surrounding 8 cells
                    for r = rowMin:rowMax
                        for c = colMin:colMax
                            if minefield(r,c) == -1
                                count = count + 1;
                            end
                        end
                    end
                    
                    % Assign the mine count to the current cell
                    minefield(row,col) = count;
                end
        end
    end                                            
end

