%% Initiate LSL Muse connection and recording
function [lib, info, outlet] = LSL_Muse_Initiation
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
    disp('Press ENTER when you have completed impedence');
    pause;
    
    % Begin recording
    clc;
    disp('Initiating recording...');
    record_path = which('LSL_Record.scpt');
    system(['osascript ' record_path]);
    WaitSecs(10);
    clc;
end