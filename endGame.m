% Purpose: Ends the game - reveal all mines, display a win or lose message
%                          and restart or close buttons
% Parameters: gameBoard – current state of the board 
%             minefield – mine layout
%             isWin – boolean value of whether the player has won (true) or lost (false)
% Return values: None


function endGame(gameBoard,minefield,isWin)

    %Reveal all bombs
    for row = 1:size(minefield,1)
        for col = 1:size(minefield,2)
            if minefield(row,col) == -1
                gameBoard(row,col) = 1;
            end
        end
    end
    
    % Short pause before updating the game board to show all mines
    pause(0.2);
    updateGameBoard(gameBoard, minefield);
    
    % Set message and message background colour according to win or lose
    if isWin
        resultText = "You win!";
        resultcolour = [0.7, 0.85, 0.7];
        playSound("win");

    else
        resultText = "You lose";
        resultcolour = [0.65, 0.4, 0.45];
        pause(0.7);
        playSound("fail");
    end
    
    % Create a message window in the center of the game window
    msgBg = uipanel(gcf, ...
        Position=[0.3 0.4 0.4 0.2], ...
        BackgroundColor=resultcolour);

    % Display win or lose message text
    uicontrol(Style="text",Parent=msgBg, ...
        String=resultText,FontSize=14,FontWeight="bold", ...
        BackgroundColor=resultcolour, ...
        Units="normalized",Position=[0.1 0.6 0.8 0.3]);

    % Button to restart the game
    uicontrol(Style="pushbutton",Parent=msgBg, ...
        String="Play Again", ...
        Units="normalized",Position=[0.15 0.1 0.3 0.3], ...
        Callback=@(~,~) restartGame(gcf));
    
    % Button to exit 
    uicontrol(Style="pushbutton",Parent=msgBg, ...
        String="Close", ...
        Units="normalized",Position=[0.55 0.1 0.3 0.3], ...
        Callback=@(~,~) close(gcf));

end