% Purpose: close the current game window and return to the difficulty selection screen
% Parameters: fig – current figure to be closed
% Return values: None

function restartGame(fig)
    close(fig);
    getDifficulty();
end