%% Initiate LSL Muse connection and recording
function [lib, info, outlet, inlet, filename, lsl_record_go] = LSL_Muse_Initiation
    % Connect to Muse
    system('osascript /Users/krigolsonlab/Desktop/Experiments/Toolboxes/Williams_Muse_LSL/LSL_Connect.scpt');
 
    % Initiate marker stream
    lib = lsl_loadlib();
    info = lsl_streaminfo(lib,'Markers','Markers',1,0,'cf_string','myuniquesourceid23443');
    outlet = lsl_outlet(info);
    
    %Wait for Impedence Check
    disp('Press ENTER when you have completed impedence');
    pause;
    
    filename = 'This_Data.txt';
    disp('Resolving an EEG stream...');
    result = {};
    while isempty(result)
        result = lsl_resolve_byprop(lib,'type','EEG'); end
    
    % create a new inlet
    disp('Opening an inlet...');
    inlet = lsl_inlet(result{1});
    lsl_record_go = 1;
end