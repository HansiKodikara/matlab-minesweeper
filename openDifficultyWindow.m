% Purpose: Close the instructions window and opens the difficulty selection window
% Parameters: instructionWindow – current figure
% Return values: None

function openDifficultyWindow(instructionWindow)
    close(instructionWindow);
    getDifficulty();
end