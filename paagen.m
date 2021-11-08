function paa = paagen(c, data)
    s = size(data); % size of data matrix
    t_n = s(2); % number of columns
    ln = t_n/c; % length of segments
    ln = ceil(ln); % can't have a fraction
    
    for i = 1:s(1) % number of rows (60)
        for N = 1:c % window size
            samples = []; % vector to store current samples
            sampleCtr = 1; % sample counter
            if (N-1) * ln < s(2)
                lowerBound = (N-1) * ln;
                upperBound = N * ln;
                for j = 1:s(2) % number of columns (600)
                    if j > lowerBound
                        if j <= upperBound
                            samples(sampleCtr) = data(i,j); % store data point in samples
                            sampleCtr = sampleCtr + 1; % increment sample counter
                        end
                    end
                end
            end
            paa(i,N) = mean(samples); % calculate the mean of all samples in the segment
        end
    end
end
