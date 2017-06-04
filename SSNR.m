function SNR = SSNR(Original,Reconstructed)
    len_O = length(Original);
    len_R = length(Reconstructed);

    % In case length of original and reconstructed audio is different
    if len_O > len_R
        Original = Original(1:len_R);   
    end
    if len_R > len_O
        Reconstructed = Reconstructed(1:len_O);
    end
    
    SNR = sum(Original.^2)/sum(((Original-Reconstructed).^2));
end