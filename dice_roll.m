function dice_roll_simulation
    % Check for necessary dice images
    diceImages = {'die1.PNG', 'die2.PNG', 'die3.PNG','die4.PNG', 'die5.PNG', 'die6.PNG'};
              
    % Verify that all dice image files exist
    missingFiles = ~cellfun(@(x) isfile(x), diceImages);
    if any(missingFiles)
        missingList = strjoin(diceImages(missingFiles), ', ');
        error('The following dice image files are missing: %s\n', missingList);
    end
    
    % Create a figure window
    hFig = figure('Name', 'Dice Roll Simulator', 'NumberTitle', 'off', 'Position', [500, 300, 400, 400], 'MenuBar', 'none', 'Resize', 'off', 'Color', [0.9, 0.9, 0.9]);
              
    % Add title label
    uicontrol('Style', 'text', 'String', 'Dice Roll Simulator', 'FontSize', 16, 'FontWeight', 'bold', 'BackgroundColor', [0.9, 0.9, 0.9],'Position', [100, 350, 200, 40]);
          
    % Initial dice display
    hAxes = axes('Parent', hFig, 'Position', [0.25, 0.4, 0.5, 0.5]);
    imshow(diceImages{1}, 'Parent', hAxes); % Display the first dice image as default
    
    % Add button to roll the dice
    uicontrol('Style', 'pushbutton', 'String', 'Roll the Dice','FontSize', 12, 'Position', [150, 50, 100, 40], 'Callback', @rollDice);
    
    % Callback function for rolling the dice
    function rollDice(~, ~)
        % Randomly select a dice image
        diceRoll = randi(6); % Random number between 1 and 6
        % Update the displayed image
        imshow(diceImages{diceRoll}, 'Parent', hAxes);
    end
end
