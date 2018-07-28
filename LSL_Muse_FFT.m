function [mean_theta, mean_alpha, mean_beta,data_stream] = LSL_Muse_FFT(inlet, data_stream)
% Pulling Data
fftOutput = [];
fftResults = [];

%Pull sample
[vec,ts] = inlet.pull_sample(); %Pull data

%Join data
data_stream = [data_stream; vec]; % Ammend new data
data_stream = data_stream(end-99:end,:); % Cut old data

%Filter data
Nyquist = 256/2;
LowCutoff = 30/Nyquist;
HighCutoff = .1/Nyquist;
[b,a] = butter(4,[HighCutoff LowCutoff]);
data_output = filter(b,a,data_stream);

%Calculate FFTs
fftOutput = fft(data_output',[],2); %Conduct FFT
fftOutput = fftOutput/length(data_output); %Normalize FFT
fftOutput = abs(fftOutput(:,1:length(data_output)/2,:))*2;
fftOutput(:,1,:) = [];
fftResults = squeeze(mean(fftOutput,3));

%Determine frequuencies
frequencyResolution = 256/length(data_output); %Frequency resolution
frequencies = frequencyResolution:frequencyResolution:length(fftOutput)*frequencyResolution;

%Extract frequency bands
mean_theta = mean(mean(fftResults([2,3],2:3))); % Extract mean theta
mean_alpha = mean(mean(fftResults([1,4],3:5))); % Extract mean alpha
mean_beta = mean(mean(fftResults(:,5:12))); % Extract mean beta
end