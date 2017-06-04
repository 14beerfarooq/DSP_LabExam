function Final_IDCT = FirstS (audio,N,percent)

l=length(audio);
r = uint32(percent*N);
Final_DCT = [];

% Taking DCT
for i=1:N:l
    chunks = audio(i:min(i+N-1,l));
    DCT_chunks = (dct(chunks));
    fy = DCT_chunks(1:min(r,length(DCT_chunks)))'; % Concatenating DCT of chunks into one vector
    Final_DCT = [Final_DCT fy];  
end

l_nDCT = length(Final_DCT);
Final_IDCT = [];

% Taking IDCT
for i=1:r:l_nDCT-r
    IDCT = idct(Final_DCT(i:min(i+r,l_nDCT)),N);
    Final_IDCT = [Final_IDCT IDCT];
end

end