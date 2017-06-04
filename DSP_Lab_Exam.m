%% Main 
[audio,fs] = audioread('sample.wav');
N = size(audio);
F = [64 128 256 512];      %N
P = [0.1 0.25 0.50 0.75];  %DCT Coefficients

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
figure(1)
subplot(2,2,1);
stem(F, ssnrs(1,:));
title('p=10%');
subplot(2,2,2);
stem(F, ssnrs(2,:));
title('p=25%');
subplot(2,2,3);
stem(F, ssnrs(3,:));
title('p=50%');
subplot(2,2,4);
stem(F, ssnrs(4,:));
title('p=75%')

%% SNRs for DOMINANT COEFFICIENTS
figure(2)
title('Dominant p Samples')
subplot(2,2,1);
stem(F, ssnrs2(1,:));
title('p=10%');
subplot(2,2,2);
stem(F, ssnrs2(2,:));
title('p=25%');
subplot(2,2,3);
stem(F, ssnrs2(3,:));
title('p=50%');
subplot(2,2,4);
stem(F, ssnrs2(4,:));
title('p=75%');
