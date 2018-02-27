%% Initiate LSL Muse connection and recording
function [inlet,data_stream] = LSL_Muse_Stream
% Connect to Muse
connect_path = which('LSL_Connect.scpt');
system(['osascript ' connect_path]);

% Initiate marker stream
lib = lsl_loadlib();

%Wait for Impedence Check
disp('Press ENTER when you have completed impedence');
pause;

% Resolve EEG Stream
result = {};
while isempty(result)
    result = lsl_resolve_bypred(lib,'type="EEG"'); end

% Stream Data
WaitSecs(5);
inlet = lsl_inlet(result{1});

data_stream = [];
data_stream = repmat(0,100,5);
end

%% Plotting continuous data

% Screen('Preference', 'SkipSyncTests', 1);
% [win, rect] = Screen('OpenWindow',0,[255 255 255],[0 0 800 600],32,2);			% This the onscreen window, where the action happen

% data_stream(:,6) = linspace(0,rect(3),1000);

%   data_stream(:,6) = linspace(0,rect(3),1000);
%     avg = mean(data_stream(:,1:4));
%     sd = std(data_stream(:,1:4));
%     for counter = 1:4
%         draw_data(1,:) = data_stream(:,6)';
%         draw_data(2,:) = (((data_stream(:,counter)-avg(counter))./sd(counter))*(rect(4)/400)+((rect(4)/6)*counter*1))';
%         Screen('DrawLines',win,draw_data,[],[0 0 0]);
%     end
%     Screen('Flip',win); 