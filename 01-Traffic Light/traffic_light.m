clc;    % Clear the command window.
clearvars;
close all

% Define color codes 
grey = [0.5, 0.5, 0.5]; 

red_off = '#7E0000';
yellow_off = '#7F7F00';
green_off = '#007F00';

colors_on = {'r','y','g'};
colors_off = {red_off, yellow_off, green_off};

% Define circle positions
circle_pos = [21, 36, 8, 8; 21, 26, 8, 8; 21, 16, 8, 8];

% Plot the traffic light body in black
f = figure;
rectangle(...
	'Position', [20 15 10 30], ...
	'Curvature', 0.2, ...
	'FaceColor', 'k')
axis equal
hold on;

% Plot the traffic light pole
rectangle('Position', [24 5 2 10],'FaceColor', grey)

% Define axis limits
xlim([0, 50]);
ylim([0, 50]);

% Plot the circles (initially all lights are off)
rectangle('Position',circle_pos(1,:), 'Curvature',[1 1], 'Facecolor', colors_off{1})
rectangle('Position',circle_pos(2,:), 'Curvature',[1 1], 'Facecolor', colors_off{2})
rectangle('Position',circle_pos(3,:), 'Curvature',[1 1], 'Facecolor', colors_off{3})

% Loop until the figure is closed
while ishandle(f)
    for i = 1:3
        if (~ishandle(f)) break; end
        % Turn on the new light 
        rectangle('Position',circle_pos(i,:), 'Curvature',[1 1], 'Facecolor', colors_on{i})
        % Turn off the previous light
        rectangle('Position',circle_pos((mod(i-2,3)+1),:),'Curvature',[1 1], 'Facecolor', colors_off{mod(i-2,3)+1})
        pause(3);
    end
end
        