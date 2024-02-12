clc;
clear;
close all;
% Load the bfmatlab package
addpath('J:\Song_Lab\Ping\06 Software\bfmatlab\bfmatlab\')

% Directory containing your .oir files
oirDirectory = pwd;

% List all .oir files in the directory
oirFiles = dir(fullfile(oirDirectory, '*.oir'));

% Loop through each file
for i = 1:length(oirFiles)
    % for i = 2:length(oirFiles)
    filePath = fullfile(oirDirectory, oirFiles(i).name);

    % Use Bio-Formats to read the .oir file
    data = bfopen(filePath);

    % Extract the base name for file identification
    [~, baseName, ~] = fileparts(oirFiles(i).name);

    % Assuming 'data{1, 1}{1, 1}' is the image data you want to analyze
    firstImage = data{1, 1}{2, 1};

    % Analyze the image with the modified function
    analyzeROIsAndCellsFromData(firstImage, baseName);

    % Note: Consider preallocating memory for efficiency if you know the number of images
end
