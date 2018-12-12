% Written by Chad C. Williams, University of Victoria, 2018.
% www.chadcwilliams.com
% Example script on how to connect, record, and send markers of a Muse Headband (2016 Versions)
% While recording using Lab Recorder

%% Setup environment
clear all;clc;close all; %Clean environment
usingMuse = 1; %Toggle the use of Muse or not

%% Initiate LSL Muse connection and recording
[lib, info, outlet] = LSL_Muse_InitiationLR(usingMuse); %This initiates the Muse, opens an 'impedance' check, and begins recording.

%Reminders
disp('Once you have checked data quality and started recording in Lab Recorder, press enter.');
pause

%% Experiment

%Send markers at .1 second intervals
for counter = 1:10
    disp(num2str(counter)); %Display iteration of for loop
    LSL_flipandmark(counter,win,outlet,usingMuse); % Pushes the marker to LSL stream
    WaitSecs(.1); %Wait .1 seconds
end

%% Stop Recording and Disconnect Muse
LSL_Muse_Shutdown; %This closes terminal windows, forcing the connections to disconnect
