%mex lsl_resolve_byprop.c
clear all;clc;close all;

%% Initiate LSL Muse connection and recording
[lib, info, outlet] = LSL_Muse_Initiation; %This initiates the Muse, opens an 'impedance' check, and begins recording.

%% Experiment

%Send markers at .1 second intervals
for counter = 1:10
    disp(num2str(counter));
    outlet.push_sample({'1'},0); % Pushes the marker to LSL stream
    WaitSecs(.1);
end

%% Stop Recording and Disconnect Muse
LSL_Muse_Shutdown; %This closes terimal windows, forcing the connections to disconnect
