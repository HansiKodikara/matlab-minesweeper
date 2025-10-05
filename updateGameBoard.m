% Purpose: update visuals of the game board to show current cell states (hidden, revealed, flagged) and draws numbers, mines, and flags
% Parameters: gameBoard – matrix showing current visibility state of each cell
%             minefield – matrix with -1 for mines and 0–8 for number hints
% Return values: None

function updateGameBoard(gameBoard, minefield)
    % Get board dimensions
    [numRows, numCols] = size(gameBoard);
    %checker pattern 
    checkerMatrix = mod((1:numRows)' + (1:numCols), 2);

    %colourmaps for different stages
    hiddenColour = [0.75 0.85 0.95; 0.60 0.75 0.90];
    revealedColour = [0.88, 0.75, 0.60; 0.78, 0.65, 0.50];
    bombColour = [0.8 0.2 0.2];

    % Create an RGB image where each cell is an m-by-n-by-3 matrix
    % source: https://au.mathworks.com/help/matlab/creating_plots/image-types.html
    boardBg = zeros(numRows,numCols,3);
    
    % Loop through each cell and assign its color based on its state
    for row = 1:numRows
        for col = 1:numCols
     
            if gameBoard(row,col) == 0
                % Hidden cell --> apply checker pattern color
                boardBg(row,col,:) = hiddenColour(checkerMatrix(row,col)+1,:);
            elseif gameBoard(row,col) == 1
                if minefield(row,col) == -1
                    % Revealed mine –-> show red bomb color
                    boardBg(row,col,:) = bombColour;
                else
                    % Revealed number cell –-> use revealed checker color
                    boardBg(row,col,:) = revealedColour(checkerMatrix(row,col)+1,:);
                end
            elseif gameBoard(row,col) == 2
                % Flagged cell – same background as hidden and flag added later
                boardBg(row,col,:) = hiddenColour(checkerMatrix(row,col)+1,:);
            end 
        end
    end
    % Display the board background 
    image(boardBg);
    axis equal tight off;
    % hold to add numbers, flags and mines
    hold on;
    
    % Draw numbers, mines, and flags over the grid
    for row = 1:numRows
        for col = 1:numCols
            if gameBoard(row,col) == 1
                % Revealed number – display number unless it's 0(empty)
                if minefield(row,col) > 0
                    text(col,row,num2str(minefield(row,col)), ...
                        HorizontalAlignment="center", ...
                        FontSize=16, ...
                        FontWeight="bold", ...
                        Color=[0 0 0]);
                elseif minefield(row,col) == -1
                    % Revealed mine – display mine icon
                    text(col,row,"⛯", ...
                        FontSize=20, ...
                        HorizontalAlignment="center")
                end

            elseif gameBoard(row,col) == 2
                % Flagged cell – display flag icon
                text(col, row, "⚑", ...
                    FontSize= 20,  ...
                    HorizontalAlignment="center", ...
                    Color=[1 0 0]);
            end
        end
    end
    
    % Set instruction title above the board
    title("Left-click to reveal | Right-click to flag ⚑",FontSize=16);
    
    % Get current number of remaining flags from game data
    data = get(gcf,"UserData");
    flagsRemaining = data.flagsRemaining;

    % Show flag counter on the left side of the board
    text(-1,numRows/2,sprintf("⚑ %i",flagsRemaining), ...
        FontSize=20, ...
        FontWeight="bold", ...
        HorizontalAlignment="center", ...
        Color=[1 0 0]);

    hold off;

end