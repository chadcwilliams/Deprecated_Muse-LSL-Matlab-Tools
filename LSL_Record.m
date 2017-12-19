%Get shit started
lib = lsl_loadlib();
info = lsl_streaminfo(lib,'Markers','Markers',1,0,'cf_string','myuniquesourceid23443');
outlet = lsl_outlet(info);
filename = 'This_Data.txt';
disp('Resolving an EEG stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type','EEG'); end
% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});
lsl_record_go = 1;
    

%Plot Data
t = 1;
    for count = 1:500
    %[temp_vec,temp_ts] = inlet.pull_sample();
    %vec(t) = temp_vec;
    %ts(t) = temp_ts;
%     lsl_data_out = [ts,vec];
%     dlmwrite([filename],lsl_data_out,'delimiter', '\t', '-append');
    t = t+1;
    disp(num2str(t));
    end