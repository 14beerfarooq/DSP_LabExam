%% Main 

[audio,fs] = audioread('sample.wav');
N = size(audio);
F = [64 128 256 512];      %N
P = [0.10 0.25 0.50 0.75];  %DCT Coefficients

ssnrs=[]; %snrs for First Coefficients 
ssnrs2=[]; %snrs for Dominant Coefficients
for j = 1 : length(P) 
    p = P(j);   %Iterate over DCT Coefficient values
    snrs = [];
    snrs2 = [];
        for i = 1 : length(F)
            f = F(i);  %Iterate over N values
            y = FirstS(audio,f,p); %Reconstructed sound for First Coefficients
            snrs = [snrs SSNR(audio',y)];
            
            
            y2 = Dominant(audio,f,p);
            snrs2 = [snrs2 SSNR(audio',y2)]; %Reconstructed sound for Dominant Coefficients
        end
    ssnrs = [ssnrs;snrs];
    ssnrs2 = [ssnrs2;snrs2];
end

%% SNRs for FIRST COEFFICIENTS

figure('Name','SNRs for First Coefficients','NumberTitle','off');
subplot(2,2,1);
stem(F, ssnrs(1,:),'filled');
text(64,1,'N=64','HorizontalAlignment','left');
text(128,1,'N=128','HorizontalAlignment','left');
text(256,1,'N=256','HorizontalAlignment','left');
text(512,1,'N=512','HorizontalAlignment','right');
title('10% DCT Coefficients');
xlabel('Frame Size (N)');
ylabel('SNR');
grid minor
subplot(2,2,2);
stem(F, ssnrs(2,:),'filled','r');
text(64,4,'N=64','HorizontalAlignment','left');
text(128,4,'N=128','HorizontalAlignment','left');
text(256,4,'N=256','HorizontalAlignment','left');
text(512,4,'N=512','HorizontalAlignment','right');
title('25% DCT Coefficients');
xlabel('Frame Size (N)');
ylabel('SNR');
grid minor
subplot(2,2,3);
stem(F, ssnrs(3,:),'filled','g');
text(64,6,'N=64','HorizontalAlignment','left');
text(128,6,'N=128','HorizontalAlignment','left');
text(256,6,'N=256','HorizontalAlignment','left');
text(512,6,'N=512','HorizontalAlignment','right');
title('50% DCT Coefficients');
xlabel('Frame Size (N)');
ylabel('SNR');
grid minor
subplot(2,2,4);
stem(F, ssnrs(4,:),'filled','m');
text(64,8,'N=64','HorizontalAlignment','left');
text(128,8,'N=128','HorizontalAlignment','left');
text(256,8,'N=256','HorizontalAlignment','left');
text(512,8,'N=512','HorizontalAlignment','right');
title('75% DCT Coefficients');
xlabel('Frame Size (N)');
ylabel('SNR');
grid minor 
ssnrs
%% SNRs for DOMINANT COEFFICIENTS
figure('Name','SNRs for Dominant Coefficients','NumberTitle','off');
subplot(2,2,1);
stem(F, ssnrs2(1,:),'filled');
text(64,6,'N=64','HorizontalAlignment','left');
text(128,6,'N=128','HorizontalAlignment','left');
text(256,6,'N=256','HorizontalAlignment','left');
text(512,6,'N=512','HorizontalAlignment','right');
title('10% DCT Coefficients');
xlabel('Frame Size (N)');
ylabel('SNR');
grid minor
subplot(2,2,2);
stem(F, ssnrs2(2,:),'filled','r');
text(64,10,'N=64','HorizontalAlignment','left');
text(128,10,'N=128','HorizontalAlignment','left');
text(256,10,'N=256','HorizontalAlignment','left');
text(512,10,'N=512','HorizontalAlignment','right');
title('25% DCT Coefficients');
xlabel('Frame Size (N)');
ylabel('SNR');
grid minor
subplot(2,2,3);
stem(F, ssnrs2(3,:),'filled','g');
text(64,15,'N=64','HorizontalAlignment','left');
text(128,15,'N=128','HorizontalAlignment','left');
text(256,15,'N=256','HorizontalAlignment','left');
text(512,15,'N=512','HorizontalAlignment','right');
title('50% DCT Coefficients');
xlabel('Frame Size (N)');
ylabel('SNR');
grid minor
subplot(2,2,4);
stem(F, ssnrs2(4,:),'filled','m');
text(64,20,'N=64','HorizontalAlignment','left');
text(128,20,'N=128','HorizontalAlignment','left');
text(256,20,'N=256','HorizontalAlignment','left');
text(512,20,'N=512','HorizontalAlignment','right');
title('75% DCT Coefficients');
xlabel('Frame Size (N)');
ylabel('SNR');
grid minor
ssnrs2

%% Bar Charts for Better Comparison
figure('Name','SNRs for First Coefficients','NumberTitle','off');
bar([64 128 256 512],ssnrs);
title('Compression using First Coefficients');
xlabel('Number of Frames (N)');
ylabel('SNR');
legend('10% DCT Coefficients', '25% DCT Coefficients'...
    , '50% DCT Coefficients', '75% DCT Coefficients'...
    ,'location', 'NorthWest');

figure('Name','SNRs for Dominant Coefficients','NumberTitle','off');
bar([64 128 256 512],ssnrs2);
title('Compression using Dominant Coefficients');
xlabel('Number of Frames (N)');
ylabel('SNR');
legend('10% DCT Coefficients', '25% DCT Coefficients'...
    , '50% DCT Coefficients', '75% DCT Coefficients'...
    ,'location', 'NorthWest');
