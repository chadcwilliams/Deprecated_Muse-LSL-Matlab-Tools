%% Initiate LSL Muse connection and recording
function [lib, info, outlet] = LSL_Muse_Initiation(usingMuse)
if usingMuse    
% Display connecting and initializing message
    disp('Connecting Muse and initializing stream...');

    % Connect to Muse
    connect_path = which('LSL_Connect.scpt');
    system(['osascript ' connect_path]);

    % Initiate marker stream
    lib = lsl_loadlib();
    info = lsl_streaminfo(lib,'Markers','Markers',1,0,'cf_string','myuniquesourceid23443');
    outlet = lsl_outlet(info);
    
    %Wait for Impedence Check
    clc;
    disp('Press ENTER when you have completed impedence and have started recording in Lab Recorder');
    pause;
   
else
    lib = [];
    info = [];
    outlet = [];
end
end