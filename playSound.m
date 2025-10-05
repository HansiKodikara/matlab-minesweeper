% Purpose: load and play sound effects 
% Parameters: soundType – string value that says which sound to play
% Return values: None

function playSound(soundType)
    % Use persistent variables to load sound files only once
    % Persistent variables remember their values between function calls
    persistent first firstFs click clickFs flag flagFs mine mineFs win winFs lost lostFs

    if soundType == "first"
        % Load all sound files the first time 
        [first,firstFs] = audioread("first.wav");
        [click,clickFs] = audioread("click.mp3");
        [flag,flagFs] = audioread("flag.wav");
        [mine,mineFs] = audioread("mine.wav");
        [win,winFs] = audioread("win.wav");
        [lost,lostFs] = audioread("fail.mp3");
    end
    
    % Play the sound according to the parameter
    switch soundType
        case "first"
            sound(first,firstFs);
        case "click"
            sound(click,clickFs);
        case "flag"
            sound(flag,flagFs);
        case "mine"
            sound(mine,mineFs);
        case "win"
            sound(win,winFs);
        case "fail"
            sound(lost,lostFs);
    end
end