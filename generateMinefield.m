% Purpose: Randomly generates a minefield of given size with mines placed away from the first clicked cell
% Parameters: gridSize – the number of rows and columns
%             numMines – total number of mines 
%             firstRow, firstCol – coordinates of the user's first click to avoid placing a mine there
% Return values: minefield – a 2D matrix with -1 for mines and 0–8 for number hints in each cell


function minefield = generateMinefield(gridSize, numMines,firstRow,firstCol)
    % Initialize board 
    minefield = zeros(gridSize);

    % Calculate total number of cells in the board 
    totalCells = gridSize ^ 2;
    % Create a list of all cell indices 
    allPositions = 1:totalCells;
    
    % A list to add cells around the first click to prevent placing mines there
    noMineCells = [];
    
    % Loop through the cells around the first clicked cell
    for r = firstRow-1:firstRow+1
        for c = firstCol-1:firstCol+1
            if r >= 1 && r <= gridSize && c >= 1 && c <= gridSize
                noMineCells = [noMineCells sub2ind([gridSize, gridSize], r, c)]; 
            end
        end
    end

    % C = setdiff(A,B) returns the data in A that is not in B, with no repetitions. C is in sorted order.
    %source = https://au.mathworks.com/help/matlab/ref/double.setdiff.html
    % Remove the first click region from allowed mine positions
    allowedPositions = setdiff(allPositions,noMineCells);

    % Generate a list of random linear positions to place mines
    % y = randsample(population,k) returns a vector of k values sampled uniformly at random, without replacement, from the values in the vector population.
    % - source: https://au.mathworks.com/help/stats/randsample.html
    minePositions = randperm(length(allowedPositions),numMines);
    
    % Loop through each position and place a mine
    for i = 1:numMines
        % [row,col] = ind2sub(sz,ind) returns the arrays row and col containing the equivalent row and column subscripts
        % - source: https://au.mathworks.com/help/matlab/ref/ind2sub.html
        % Convert linear indices to (row, col) and place -1 in mine positions
        [row,col] = ind2sub([gridSize gridSize],allowedPositions(minePositions(i)));
        minefield(row,col) = -1; % -1 represents a mine
    end

    % Calculates the numbers (0–8) for all non-mine cells by checking their neighbors.
    minefield = assignMineCounts(minefield);
end 